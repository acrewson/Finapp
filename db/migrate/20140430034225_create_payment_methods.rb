class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.integer :log_id
      t.string :method_name
      t.binary :is_default

      t.timestamps
    end
  end
end
