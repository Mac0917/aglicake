class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :genre_id
      t.string :name
      t.string :item_image_id
      t.integer :status,default: 0 ,null: false
      t.text :explanation
      t.integer :excluded
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
