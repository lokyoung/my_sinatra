require 'sinatra'

before do
  content_type :txt
end

get '/har-har' do
  stream do |out|
	out << "Wanna hear a joke?\n"
	sleep 1.5
	out << "K.\n"
	sleep 1.5
	out << "haha\n"
	sleep 1.5
	out << "Na.\n"
  end
end
