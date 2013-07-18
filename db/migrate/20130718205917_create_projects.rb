class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :objective
      t.references :user, index: true
      t.datetime :due_date
      t.boolean :completed

      t.timestamps
    end
  end
end
