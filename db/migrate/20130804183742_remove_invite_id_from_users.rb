class RemoveInviteIdFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :invitation_id
  end
end
