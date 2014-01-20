#Go grab dependency modules auto
require 'rubygems'  
require 'bundler'
Bundler.require

require './todo'
use Rack::MethodOverride
run ToDoApp
