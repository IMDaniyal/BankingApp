class User < ApplicationRecord
  has_secure_password
  belongs_to :branch
  has_many :accounts

  validates :email , presence: true, uniqueness: true
end
