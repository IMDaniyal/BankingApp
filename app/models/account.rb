class Account < ApplicationRecord
  encrypts :pin

  belongs_to :user
  belongs_to :account_type
  has_one :overdraft
  has_many :transactions

  after_create :allocate_overdraft

  def allocate_overdraft
    od = Overdraft.new(available: true, account_id: id)
    case account_type.name
    when "Current Account"
      od.limit = 100
    when "Saving Account"
      od.limit = 50
    when "Student Account"
      od.limit = 10
    else
      od.available = false
    end

    od.save
  end
end
