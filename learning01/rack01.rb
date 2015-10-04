require 'sinatra'

get '/' do
  'hi'
end

not_found do
  "Sinatra doesn't know this ditty!"
end
