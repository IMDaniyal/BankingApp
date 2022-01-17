class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.string :source
      t.string :sender
      t.string :receiver
      t.datetime :time
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
