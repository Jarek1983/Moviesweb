class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true, 
    :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    has_many :movies, foreign_key: :user_id
    has_many :actors, foreign_key: :user_id
    has_many :comments, foreign_key: :user_id
end
