class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.belongs_to :branch, null: false, foreign_key: true
      t.string :home_address
      t.string :phone_number
      t.string :passport_no

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
