class RemoveNameFromTeam < ActiveRecord::Migration
  def change
  	remove_column :teams, :name
  end
end
