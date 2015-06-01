class Status < ActiveRecord::Base
  # Remember to create a migration!
  has_many :status_tags
  has_many :tags, through: :status_tags
   has_many :likes
   has_many :comments
   belongs_to :user
  # validates :title, presence: true, length: {minimum: 5}
  # validates :body, presence: true, length: {minimum: 10}

  def get_tags_string
  string = ""
  tags.each { |x| string << x.name << "," }
  string[0...-1]
  end
end
