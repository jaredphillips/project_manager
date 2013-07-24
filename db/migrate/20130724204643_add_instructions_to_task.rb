class AddInstructionsToTask < ActiveRecord::Migration
  def change
  	add_column :tasks, :instructions, :string
  end
end
