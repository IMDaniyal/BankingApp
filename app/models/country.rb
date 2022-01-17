class Country < ApplicationRecord
    has_many :branches
    validates :name , presence: true, uniqueness: true
end
