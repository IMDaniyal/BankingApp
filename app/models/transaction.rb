class Transaction < ApplicationRecord
  belongs_to :account
  has_many :historylogs
end
