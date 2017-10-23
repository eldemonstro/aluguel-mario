class CreateSeasonRates < ActiveRecord::Migration[5.1]
  def change
    create_table :season_rates do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.decimal :daily_rate

      t.timestamps
    end
  end
end
