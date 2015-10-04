require 'sinatra'

before do
  content_type :txt
end

connections = []

get '/consume' do
  stream(:keep_open) do |out|
	connections << out

	out.callback {connections.delete(out)}

	out.errback do
	  logger.warn 'Lost a connection!'
	  connections.delete(out)
	end
  end
end

get '/broadcast/:message' do
  connections.each do |out|
	out << "#{Time.now} -> #{params[:message]}" << "\n"
  end
  "Send #{params[:message]} to all clients."
end
