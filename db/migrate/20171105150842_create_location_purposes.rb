class CreateLocationPurposes < ActiveRecord::Migration[5.1]
  def change
    create_table :location_purposes do |t|
      t.string :title

      t.timestamps
    end
  end
end
