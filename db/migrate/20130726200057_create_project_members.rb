class CreateProjectMembers < ActiveRecord::Migration
  def change
    create_table :project_members do |t|
      t.references :project, index: true
      t.references :user, index: true
    end
  end
end
