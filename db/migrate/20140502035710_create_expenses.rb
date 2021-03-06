class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.integer :log_id
      t.string :description
      t.decimal :amount
      t.date  :date_cash
      t.date :date_expense
      t.integer :category_id
      t.integer :deprec_months
      t.integer :method_id
      t.integer :user_id
      t.boolean :is_outlier

      t.timestamps
    end
  end
end
