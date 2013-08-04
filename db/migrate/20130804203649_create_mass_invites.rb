class CreateMassInvites < ActiveRecord::Migration
  def change
    create_table :mass_invites do |t|
      t.references :team, index: true

      t.timestamps
    end
  end
end
