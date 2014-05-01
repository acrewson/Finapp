class CreateUserLogs < ActiveRecord::Migration
  def change
    create_table :user_logs do |t|
      t.integer :user_id
      t.integer :log_id

      t.timestamps
    end
  end
end
