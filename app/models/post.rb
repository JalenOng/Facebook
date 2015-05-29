class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags
  has_many :tags, through: :post_tags
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true, length: {minimum: 10}

  def get_tags_string
  string = ""
  tags.each { |x| string << x.name << "," }
  string[0...-1]
  end
end
