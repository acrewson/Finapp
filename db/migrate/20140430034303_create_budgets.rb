class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :log_id
      t.integer :category_id
      t.integer :year
      t.integer :month
      t.decimal :budget

      t.timestamps
    end
  end
end
