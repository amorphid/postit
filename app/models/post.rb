class Post < ActiveRecord::Base
  include Voteable

  belongs_to :category
  belongs_to :user

  has_many :comments
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :url, presence: true
  validates :category_id, presence: true
end
