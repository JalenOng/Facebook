get '/tag/:name' do
@tag = Tag.find_by(name: params[:name])


erb :"/tag/show"

end