

get '/status/:status_id/likes' do
 @user = User.find(session[:user_id])
 @status = Status.all
  @like = Like.create(status_id: params[:status_id], user_id: @user.id)


erb :user
end


# #create
# post '/status/' do
# @user = User.find(session[:user_id])

# @status = Status.new(body: params[:body], user_id: @user.id)
# tags_array = params[:tags].split(",").uniq
# tags = tags_array.map{|tag| Tag.create(name: tag)}
# @status.tags = tags

# #post
# if @status.save
# redirect to "/user/:user_id"

# else
# erb :"status/new"
# end
# end


# #show
# get '/status/:id' do
# @post = Post.find(params[:id])

# erb :"/status/show"

# end