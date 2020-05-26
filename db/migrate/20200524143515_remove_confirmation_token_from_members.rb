class RemoveConfirmationTokenFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :confirmation_token, :string
  end
end
