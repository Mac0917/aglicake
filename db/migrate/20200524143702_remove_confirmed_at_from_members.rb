class RemoveConfirmedAtFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :confirmed_at, :datetime
  end
end
