class SetDefaultForBalanceInAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :accounts, :balance, 0
  end
end
