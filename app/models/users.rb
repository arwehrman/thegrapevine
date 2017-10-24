class User < ActiveRecord::Base
  has_secure_password
  has_many :wines
  has_many :comments
  validates :username, presence: true
  validates :email, presence: true
end
