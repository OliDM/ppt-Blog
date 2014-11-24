require 'sinatra'
require 'data_mapper'
require 'json'
require 'dm-core'
require 'dm-tags'

DataMapper.setup :default, 'sqlite3::memory:'

class Posts
	include DataMapper::Resource

	property :id, Serial
	property :title, Text, :required => true
	property :autor, Text
	property :description, Text
	property :short_description, Text
	has_tags_on  :tags 
end

DataMapper.finalize.auto_upgrade!

file = File.read('posts.json')
_posts = JSON.parse(file)

_posts['posts'].each do |post| 

	p = Posts.create(
		:id => post['id'],
		:title => post['title'],
		:autor => post['autor'],
		:description => post['description']) 
	p.tag_list = post['tags']
	puts p.tag_list
	p.short_description = post['description'].split[1..10].join(" ")
	p.save

end

get '/' do

	erb :index
end

get 'tags/:id' do
	@tag = Note.get params[:id]
	@title = "The tag you searched for is ##{params[:id]}"
	erb :tags
end