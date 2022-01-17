# frozen_string_literal: true

# It builds a unique 16 digit account number
module AccountNumberBuilder
  include ActiveSupport::Concern

  def build_account_number
    ac_number = random_account_number
    loop do
      break unless Account.where(account_number: ac_number).present?
      ac = random_account_number
    end
    ac_number
  end

  def random_account_number
    chars = ['0'..'9'].map(&:to_a).flatten
    Array.new(16).map { chars[rand(chars.size)] }.join
  end
end
