get '/' do
  @post = Post.all
  # Look in app/views/index.erb
  #display all post
  #link to create new post
  erb :index
end
