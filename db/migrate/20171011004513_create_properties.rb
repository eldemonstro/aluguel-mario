class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.string :location
      t.string :area
      t.string :title
      t.text :description
      t.decimal :daily_rate
      t.integer :rooms
      t.integer :minimum_rent_days
      t.integer :maximum_rent_days
      t.string :photo
      t.integer :maximum_occupancy
      t.text :usage_rules

      t.timestamps
    end
  end
end
