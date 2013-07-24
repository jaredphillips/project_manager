class AddOwnerToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :owner, :boolean, default: false
  end
end
