enable :session

def logged_in?
  if session[:user_id] == nil
    false
  else
    true
  end
end

def username
  @user = User.find(session[:user_id])
  @user.username
end


get '/' do
  
erb :index
end

post '/logout' do

session.clear
redirect to '/'
end

get '/user/sign_up' do

erb :"/user/sign_up"
end

#ok
post '/user/sign_up' do

@user = User.new(params[:user])

if @user.save
  session[:user_id] = @user_id
  # redirect to "/user/#{@user.id}"
redirect to '/'
else
  redirect to "/user/sign_up"
end

end

#ok
post '/login' do

  @result = User.authenticate(params[:user][:username], params[:user][:password])

  if @result == nil
    redirect to "/"
  else
    session[:user_id] = @result.id
    
    redirect to "/user/#{@result.id}"
  end

end

get '/user/:user_id' do

  if session[:user_id] == nil
    redirect to "/"
  else
    @status = Status.all
     erb :user
  end
 
end



#page to update user profile
get '/user/profile/edit' do

@user = User.find(session[:user_id])

erb :"/user/edit"
end

#update
put '/user/edit' do
@user = User.find(session[:user_id])

@user.username = params[:username]
@user.password = params[:password]

if @user.save
redirect to "/user/#{@user.id}"
else
erb :"user/edit"
end

end

#delete user
delete '/user/profile/delete' do
@user = User.find(session[:user_id])
session.clear
@user.destroy
redirect to "/"
end




