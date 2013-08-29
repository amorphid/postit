class Category < ActiveRecord::Base
  has_many :tags
  has_many :posts, through: :post_categories

  validates :name, presence: true
end
