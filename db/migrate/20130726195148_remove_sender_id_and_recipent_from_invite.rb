class RemoveSenderIdAndRecipentFromInvite < ActiveRecord::Migration
  def change
  	remove_column :invitations, :sender_id
  	remove_column :invitations, :recipient_email
  end
end
