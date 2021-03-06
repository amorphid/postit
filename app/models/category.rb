class Category < ActiveRecord::Base
  has_many :tags
  has_many :posts

  validates :name, presence: true, uniqueness: true
end
