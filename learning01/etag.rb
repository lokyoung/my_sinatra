require 'sinatra'
require 'uuid'

before do
  content_type :txt
  @guid = UUID.new.generate
end

get '/strong_etag' do
  etag @guid
  "This resource has an ETag value of #{@guid}"
end

get '/weak_etag' do
  etag @guid, :weak
  "This resource has an ETag valud of #{@guid}"
end
