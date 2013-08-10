class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  has_many :tags
  has_many :categories, through: :tags
end
