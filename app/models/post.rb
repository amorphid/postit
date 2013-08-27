class Post < ActiveRecord::Base
  belongs_to :user

  has_many :comments

  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :votable

  validates :title, presence: true
  validates :url, presence: true

  def score
    upvotes = self.votes.select { |vote| vote.value == 1}
    downvotes = self.votes.select { |vote| vote.value == -1}
    upvotes.count - downvotes.count
  end
end
