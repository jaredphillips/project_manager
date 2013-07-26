class RemoveProjectidFromTeam < ActiveRecord::Migration
  def change
  	remove_column :teams, :project
  end
end
