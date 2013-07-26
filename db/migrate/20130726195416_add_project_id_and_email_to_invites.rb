class AddProjectIdAndEmailToInvites < ActiveRecord::Migration
  def change
  	add_column :invitations, :project_id, :integer
  	add_column :invitations, :email, :integer
  end
end
