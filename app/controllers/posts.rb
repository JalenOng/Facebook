#new
get '/posts/new' do
@tags = Tag.all
erb :'posts/new'
end
#create
post '/posts' do

@post = Post.new(params[:post])
tags_array = params[:tags].split(",").uniq
tags = tags_array.map{|tag| Tag.create(name: tag)}
@post.tags = tags

#post
if @post.save
redirect to "/posts/#{@post.id}"

else
erb :"posts/new"
end


end
#show
get '/posts/:id' do
@post = Post.find(params[:id])

erb :"/posts/show"

end
#edit
get '/posts/:id/edit' do
@post = Post.find(params[:id])

@tags = @post.get_tags_string

byebug
erb :"/posts/edit"

end
#update
put '/posts/:id' do
@post = Post.find(params[:id])
tags_array = params[:tags].split(",").uniq
tags = tags_array.map{|tag| Tag.create(name: tag)}
@post.update(params[:post])
# find tag then update here
@post.tags = tags

if @post.save
redirect to "/posts/#{@post.id}"
else
erb :"posts/edit"
end
end
#delete
delete '/posts/:id' do
post = Post.find(params[:id])
post.destroy
redirect to "/"
end