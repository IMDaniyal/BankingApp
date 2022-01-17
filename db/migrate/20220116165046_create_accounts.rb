class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :balance
      t.integer :pin
      t.string :account_number
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :account_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
