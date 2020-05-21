class CreateShippingAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_addresses do |t|
      
      t.timestamps
      t.integer     :member_id
      t.string      :delively_address
      t.string      :delively_name
      t.string      :post_number
    end
  end
end
