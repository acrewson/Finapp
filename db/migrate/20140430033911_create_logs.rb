class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :log_name
      t.integer :main_user_id
      t.date :datedeleted

      t.timestamps
    end
  end
end
