class RemoveConfirmationSentAtFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :confirmation_sent_at, :datetime
  end
end
