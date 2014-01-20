require 'rack'

hello = lambda do |env|
  [200, {"Content-Type" => "text/plain"}, ["Hello, world!"]]
end

run hello


