DATABASE_URL = ENV['DATABASE_URL'] || 'postgres://localhost/to_do_app'
WEATHER_UNDERGROUND_API_KEY = ENV['WEATHER_UNDERGROUND_API_KEY'] || '7e4220992d5fe025'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, DATABASE_URL)

class SimpleStore
  def destroy
    self.class.remove(self)
  end

  def save
    self.class.add(self)
  end

  def self.add(item)
    items << item
  end

  def self.all
    items
  end

  def self.create(*arguements)
    item = new(*arguements)
    add(item)
    item
  end

  def self.items
    @items ||= Set.new
  end

  def self.remove(item)
    items.delete(item)
  end
end

class Task < SimpleStore
  include DataMapper::Resource

  property :id, Serial
  property :description, String
  property :done, Boolean
  property :due_date, Date

  # attr_accessor :description

  # def initialize(attributes)
  #   @description = attributes[:description]
  # end

  def to_s
      description
  end

  def due_date=(date)
      date = nil if date == ''
      super date
  end

end

DataMapper.finalize
Task.auto_upgrade!

class List
    TEMPLATE = ERB.new(<<-EOS, nil, '-')
  # To Do List
  <% @tasks.each do |task| -%>
    - [<%= task.done? ? 'x' :  ' ' %>] <%= task %>
    <% end %>
  EOS
# To Do List
<% @tasks.each do |task| -%>
- [<%= task.done? ? 'x' :  ' ' %>] <%= task %>
<% end %>
EOS

  def initialize(tasks)
    @tasks = tasks
  end

  def to_markdown
    TEMPLATE.result(binding)
  end
end

class Forecast
  CONNECTION = Faraday.new url: 'http://api.wunderground.com' do |connection|
    connection.response :json, :content_type => /\bjson$/
    connection.adapter Faraday.default_adapter
  end

  def self.ten_day_forecast(key, state, city)
    url= "/api/#{ key }/forecast10day/q/#{ state}/#{ city }.json"
    consume(CONNECTION.get(url).body)
  end

  def self.consume(body)
    get_forecast_days(body).reduce({}) do |all, forecast_day|
      all.merge(get_date(forecast_day) => get_icon(forecast_day))
    end
  end

  def self.get_forecast_days(body)
    body['forecast']['simpleforecast']['forecastday']
  end

  def self.get_date(forecast_day)
    year, month, day = forecast_day['date'].values_at('year', 'month', 'day')
    Date.new(year, month, day)
  end

  def self.get_icon(forecast_day)
    forecast_day['icon_url']
  end
end

class ToDoApp < Sinatra::Base
  get '/' do
    # Task.create(description: 'Create web application!')
    # Task.create(description: 'Profit from it')
    @tasks = Task.all
    @forecast = Forecast.ten_day_forecast(WEATHER_UNDERGROUND_API_KEY, 'GA', 'Atlanta')
    erb :index
  end

  post '/' do
    Task.create(params)
    redirect '/'
  end

  patch '/:id' do
    task = Task.get(params[:id])
    task.done = !task.done
    task.save
    redirect '/'
  end

  delete '/:id' do
    task = Task.get(params[:id])
    task.destroy
    redirect '/'
  end

  post '/export' do
    list = List.new(Task.all)
    gist = Gist.gist(list.to_markdown, filename: 'ToDoList.md')
    redirect gist['html_url']
  end

  get '/:id' do
    @task = Task.get(params[:id])
    erb :show
  end

  put '/:id' do
    task= Task.get(params[:id])
    task.update(
      description: params[:description],
      done: params[:done],
      due_date: params[:due_date]
      )
    redirect '/'
  end

end
















