class Comment < ActiveRecord::Base
  # Remember to create a migration!
    belongs_to :status
 	belongs_to :user
end
