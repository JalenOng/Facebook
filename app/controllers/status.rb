#new ok
get '/status/new' do
@tags = Tag.all
erb :'status/new'
end


#create
post '/status' do
@user = User.find(session[:user_id])

@status = Status.new(body: params[:body], user_id: @user.id)
tags_array = params[:tags].split(",").uniq
tags = tags_array.map{|tag| Tag.create(name: tag)}
@status.tags = tags

#post
if @status.save
redirect to "/user/:user_id"

else
erb :"status/new"
end
end






# #show
# get '/status/:id' do
# @post = Post.find(params[:id])

# erb :"/status/show"

# end

#edit
get '/status/:status_id/edit' do
@status = Status.find(params[:status_id])

@tags = @status.get_tags_string


erb :"/status/edit"

end
#update
put '/status/:status_id' do
@user = User.find(session[:user_id])
@status = Status.find(params[:status_id])
tags_array = params[:tags].split(",").uniq
tags = tags_array.map{|tag| Tag.create(name: tag)}
@status.update(body: params[:body])
# find tag then update here
@status.tags = tags


if @status.save
redirect to "/user/@user.id"
else
erb :"status/edit"
end
end


delete '/status/:status_id/delete' do
@user = User.find(session[:user_id])
status = Status.find(params[:status_id])
status.destroy
redirect to "/user/#{@user.id}"
end