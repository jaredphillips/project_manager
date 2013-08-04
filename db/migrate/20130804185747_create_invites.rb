class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :email
      t.references :team, index: true
      t.boolean :accepted
      t.string :token

      t.timestamps
    end
  end
end
