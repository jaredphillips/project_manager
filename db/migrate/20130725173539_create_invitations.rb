class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitation do |t|

      t.timestamps
    end
  end
end
