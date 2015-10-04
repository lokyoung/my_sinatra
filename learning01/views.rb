require 'sinatra'

get '/test' do
  erb :test
end

get '/:user/help' do
  erb :'/user/help'
end
