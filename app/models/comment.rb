class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validate :body, presence: true
end
