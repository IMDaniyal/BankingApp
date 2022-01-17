class Branch < ApplicationRecord
    belongs_to :country
    belongs_to :city
    has_many :users

    validates :name , presence: true, uniqueness: true
end
