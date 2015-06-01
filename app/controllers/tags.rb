get '/tag/:name' do
@tags = Tag.find_by(name: params[:name])

# @tags = Tag.where(name: params[:name])
# redirect_error("/", "Tag not found.") if @tags.empty?

erb :"/tag/show"

end