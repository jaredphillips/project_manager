class DropProjectMembers < ActiveRecord::Migration
  def change
  	drop_table :project_members
  end
end
