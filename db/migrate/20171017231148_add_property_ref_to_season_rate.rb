class AddPropertyRefToSeasonRate < ActiveRecord::Migration[5.1]
  def change
    add_reference :season_rates, :property, foreign_key: true
  end
end
