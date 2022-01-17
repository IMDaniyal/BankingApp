class AccountType < ApplicationRecord
    has_many :accounts

    validates :name , presence: true, uniqueness: true
end
