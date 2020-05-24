class AddPostNmberToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :post_number, :string
  end
end
