require 'sinatra'
require 'rack'

use Rack::Runtime

get('/') { 'Hello world!' }
