require_relative '../app/models/post.rb'
require_relative '../app/models/post_tag.rb'
require_relative '../app/models/tag.rb'

20.times do
Post.create(title: Faker::Commerce.product_name, body: Faker::Lorem.sentence)
Tag.create(name: Faker::Commerce.department(1))
end
