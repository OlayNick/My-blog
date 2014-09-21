
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:my_blog.db"

class Post < ActiveRecord::Base
end

# def get_db
# 	@db = SQLite3::Database.new 'my_blog.db'
# 	@db.results_as_hash = true
# 	return @db
# end

# before do	
# 	get_db
# end

# configure do
# 	get_db
# 	@db.execute 'CREATE TABLE if not exists Posts 
# 	(
# 		id INTEGER PRIMARY KEY AUTOINCREMENT,
# 		content TEXT,
# 		create_date DATE,
# 		username TEXT
# 	)'

# 	@db.execute 'CREATE TABLE if not exists Comments 
# 	(
# 		id INTEGER PRIMARY KEY AUTOINCREMENT,
# 		content TEXT,
# 		create_date DATE,
# 		post_id INTEGER
# 	)'
# end   

get '/' do
	# @results = @db.execute 'select * from Posts order by id desc'
  	erb :index
end

get '/new' do
	erb :new
end

post '/new' do
  @post_txt = params[:post_txt]
  @username = params[:username]
  # hh = {:username => "Представьтесь", :post_txt => "Введите текст поста"}
  # hh.each do |k, v|
  # 	if params[k].size < 1
  # 		@error = v
  # 		return erb :new
  # 	end
  # end
  # if @post_txt.size < 1
  # 		@error = "Введите текст поста"
  # 		return erb :new
  # end
  # @db.execute 'insert into Posts
  # (
  # 	content,
  # 	create_date,
  # 	username
  # ) values (?, datetime(), ?)', [@post_txt, @username]

  redirect to '/'
end

get '/details/:post_id' do
	# def com
	#   @post_id = params[:post_id]
	#   results = @db.execute 'select * from Posts where id = ?', [@post_id]
	#   @row = results[0]
	#   @comments = @db.execute 'select * from Comments where post_id = ? order by id desc', [@post_id]
	# end

	# com
	erb :details
end

post '/details/:post_id' do
	post_id = params[:post_id]
	@comment_txt = params[:comment_txt]

	# if params[:comment_txt].size == 0
 #  		@error = "Введите текст комментария..."
 #  		com
 #  		return erb :details 
 #    end

	# @db.execute 'insert into Comments
	# (
	# 	content,
	#   	create_date,
	#   	post_id
	# ) values (?, datetime(), ?)', [@comment_txt, post_id]

   redirect to('/details/'+ post_id)
end