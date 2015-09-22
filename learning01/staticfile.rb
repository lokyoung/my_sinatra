require 'sinatra'

# 必须加上这个操作才可以在浏览器中看到error的返回结果
configure do
  set :show_exceptions, false
end

configure do
  mime_type :plain, 'text/plain'
end

before '/plain-text' do
  content_type :plain
end

get '/plain-text' do
  '<h1>Just text here.</h1>'
end

get '/public.html' do
  'This is delivered via the route.'
end

get '/zero' do
  0 / 0
end

not_found do
  'The resource not found.'
end

error do
  'You have done something wrong.'
end
