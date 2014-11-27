require 'sinatra'
require 'data_mapper'
require 'json'
require 'dm-core'
require 'dm-tags'
require 'sinatra/partial'
require 'debugger'

DataMapper.setup :default, 'sqlite3::memory:'

class Posts
	include DataMapper::Resource

	property :id, Serial
	property :title, Text
	property :author, Text
	property :description, Text
	property :short_description, Text
	has_tags_on  :tags 
end

set :partial_template_engine, :erb

DataMapper.finalize.auto_upgrade!

file = File.read('posts.json')
_posts = JSON.parse(file)

_posts['posts'].each do |post| 

	p = Posts.create(
		:id => post['id'],
		:title => post['title'],
		:author => post['author'],
		:description => post['description']) 

	p.short_description = post['description'].split[1..10].join(" ")
	p.tag_list = post['tags'].split(",")
	p.save
end
def Get_Tags
	tags = {}
	Posts.all.each do |p|

		p.tags.each do |t|

			if tags.has_key? t.name then
				tags[t.name]+=1
			else
				tags[t.name]=1
			end
		end
	end
	tags = Hash[tags.sort_by {|_key, value| value}.reverse]
	set :taglist, tags
end

Get_Tags()

get '/' do
	@posts = Posts.all 
	erb :index
end

get '/post/:id' do |id|

	_message ="invalid " unless id.is_a? Numeric

	@post = Posts.get(id)
	erb :post
end

get '/tags/:id' do |id|

	param = id
	@title = "The tag you searched for is #{param}"
	@posts = Posts.tagged_with(param)
	erb :tags

end