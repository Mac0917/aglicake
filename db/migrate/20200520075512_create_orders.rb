class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :member_id
      t.string :delivery_address
      t.string :delivery_price
      t.string :delivery_name
      t.string :payment_methods
      t.string :status
      t.string :total_price
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
