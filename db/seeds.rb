require_relative '../app/models/user.rb'

require_relative '../app/models/tag.rb'
require_relative '../app/models/comment.rb'
require_relative '../app/models/like.rb'
require_relative '../app/models/status.rb'

a = 1
3.times do
  User.create(username: Faker::Internet.user_name, password: a)
  a += 1
end


20.times do
Status.create(body: Faker::Commerce.product_name)
Tag.create(name: Faker::Commerce.department(1))
Comment.create(body: Faker::Lorem.sentence)
end

