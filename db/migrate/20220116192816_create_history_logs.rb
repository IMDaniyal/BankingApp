class CreateHistoryLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :history_logs do |t|
      t.string :type
      t.string :source
      t.belongs_to :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
