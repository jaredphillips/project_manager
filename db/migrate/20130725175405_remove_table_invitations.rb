class RemoveTableInvitations < ActiveRecord::Migration
  def change
  	drop_table :invitation
  end
end
