#new comment
get '/:status_id/comments/new' do

@status = Status.find(params[:status_id])

erb :'comment/new'
end

#create new comment
post '/:status_id/comments' do

@user = User.find(session[:user_id])
@status = Status.find(params[:status_id])

@comment = Comment.new(body: params[:body], user_id: @user.id, status_id: @status.id)


if @comment.save
redirect to "/user/:user_id"

else
erb :"comment/new"
end
end




get '/comment/:comment_id/edit' do
@comment = Comment.find(params[:comment_id])


erb :"/comment/edit" 

end
#update
put '/comment/:comment_id' do
@user = User.find(session[:user_id])
@comment = Comment.find(params[:comment_id])

@comment.update(body: params[:body])


if @comment.save
redirect to "/user/@user.id"
else
erb :"comment/edit"
end
end


delete '/comment/:comment_id/delete' do
@user = User.find(session[:user_id])
comment = Comment.find(params[:comment_id])
comment.destroy
redirect to "/user/#{@user.id}"
end