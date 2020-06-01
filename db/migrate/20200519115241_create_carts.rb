class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|

      t.integer :member_id
      t.integer :item_id
      t.integer :quantity
      t.integer :excluded
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
