require 'sinatra'
require 'rubygems'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
end

DataMapper.finalize

# atuomatically create the post table
Post.auto_upgrade!
