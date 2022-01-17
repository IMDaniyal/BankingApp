class SetDefaultForOverdraftsInAccounts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :overdrafts, :limit, 0
    change_column_default :overdrafts, :available, false
    change_column_default :overdrafts, :used_amount, 0
  end
end
