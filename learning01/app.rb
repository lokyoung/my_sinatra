require 'sinatra'
require 'haml'

get '/hi' do
  'Hello World!'
end

#get '/hello/:name' do
#  "Hello, #{params['name']}!"
#end

get '/hello/:name' do |n|
  "Hello, #{n}"
end

get '/say/*/to/*' do
  params['splat']
end

get '/foo', :agent => /Songbird (\d.\d)[\d\/]*?/ do
  "You are using Songbird version #{params['agent'][0]}"
end

get '/foo' do
  'foo'
end

set(:probability) { |value| condition{ rand <= value} }

get '/win_a_car', :probability => 0.1 do
  "You won!"
end

get '/win_a_car' do
  "Sorry, you lost"
end

class Stream
  def each
	100.times { |i| yield "#{i}\n"}
  end
end

#get('/') { Stream.new }

#get '/' do
#  haml '%div.title Hello World'
#end

#get '/' do
#  haml :index
#end

enable :sessions

get '/' do
  @posts = Post.all()
  erb :index
  # session['counter'] ||= 0
  # session['counter'] += 1
  # "You've hit this page #{session['counter']} times!"
end

__END__

@@ layout
%html
  = yield

@@ index
%div.title Hello World
