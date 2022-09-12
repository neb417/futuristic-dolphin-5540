class AddAmusementParktoMechanics < ActiveRecord::Migration[5.2]
  def change
    add_column :mechanics, :amusement_park_id, :integer
    add_index :mechanics, :amusement_park_id
  end
end
