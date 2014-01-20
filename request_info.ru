require 'rack'
require 'rack/lobster'
require 'rack/file'

request_info = lambda do |env|
  request = Rack::Request.new(env)
  method = request.request_method
  path = request.path
  request_body = request.body.read
  request_params = request.params

  body = "Method: #{method}\n Path: #{path}\nRequest Body: #{request_body}"
  [200, {"Content-Type" => "text/plain"}, [body]]
end

map '/lobster' do
  run Rack::Lobster.new
end

map '/request_info' do
    run request_info
end

map "/source_code" do
  run Rack::File.new("./request_info.ru")
end

Rack::File.new("./")



