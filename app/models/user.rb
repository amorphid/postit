require "bcrypt"

class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  has_many :votes

  has_secure_password

	validates :password, length: { minimum: 8 }
  validates :username, presence: true, uniqueness: true
end
