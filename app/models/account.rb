class Account < ApplicationRecord
  encrypts :pin

  belongs_to :user
  belongs_to :account_type
  has_one :overdraft
  has_many :transactions
end
