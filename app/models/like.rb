class Like < ActiveRecord::Base
  # Remember to create a migration!
    belongs_to :status
 	belongs_to :user
 	validates :status_id, uniqueness: true
end
