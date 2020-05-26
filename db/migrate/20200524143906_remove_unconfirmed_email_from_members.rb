class RemoveUnconfirmedEmailFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :unconfirmed_email, :string
  end
end
