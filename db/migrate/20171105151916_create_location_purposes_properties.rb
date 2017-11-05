class CreateLocationPurposesProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :location_purposes_properties, id: false do |t|
      t.belongs_to :location_purpose, index: true
      t.belongs_to :property, index: true
    end
  end
end
