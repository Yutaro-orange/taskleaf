class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  has_many :tasks
  validates :email, presence: true ,uniqueness: true
end
