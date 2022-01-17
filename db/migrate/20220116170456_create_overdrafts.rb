class CreateOverdrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :overdrafts do |t|
      t.integer :limit
      t.boolean :available
      t.integer :used_amount
      t.belongs_to :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
