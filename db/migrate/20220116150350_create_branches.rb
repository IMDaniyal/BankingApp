class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|
      t.string :name
      t.belongs_to :city, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end