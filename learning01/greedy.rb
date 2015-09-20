require 'sinatra'

get '/specify' do
  "But I'm the specify"
end

get '/*' do
  "I' so greedy!"
end

#get '/specify' do
#  "But I'm the specify"
#end
