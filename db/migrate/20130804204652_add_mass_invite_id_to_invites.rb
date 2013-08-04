class AddMassInviteIdToInvites < ActiveRecord::Migration
  def change
    add_reference :invites, :mass_invite, index: true
  end
end
