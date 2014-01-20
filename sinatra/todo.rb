DATABASE_URL = ENV['DATABASE_URL'] || 'postgres://localhost/to_do_app'

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

  # attr_accessor :description

  # def initialize(attributes)
  #   @description = attributes[:description]
  # end

  def to_s
      description
  end
end

DataMapper.finalize
Task.auto_upgrade!

class ToDoApp < Sinatra::Base
  get '/' do
    # Task.create(description: 'Create web application!')
    # Task.create(description: 'Profit from it')
    @tasks = Task.all
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

end

