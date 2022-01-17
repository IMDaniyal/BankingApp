class ChangePinToBeStringInAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column :accounts, :pin, :string
  end
end
