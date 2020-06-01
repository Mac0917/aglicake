class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.string :delivery_address
      t.string :delivery_price
      t.string :delivery_name
      t.string :payment_methods, default: 0
      t.integer :status, default: 0
      t.integer :total_price

      t.datetime :created_at 
      t.datetime :updated_at
      t.timestamps
    end
  end
end
