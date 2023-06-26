class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.references :task, null: false, foreign_key: true
      t.references :assignee
      t.references :assignor
      t.integer :status

      t.timestamps
    end
  end
end
