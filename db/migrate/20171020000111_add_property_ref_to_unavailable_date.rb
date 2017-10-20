class AddPropertyRefToUnavailableDate < ActiveRecord::Migration[5.1]
  def change
    add_reference :unavailable_dates, :property, foreign_key: true
  end
end
