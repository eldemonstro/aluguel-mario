class ChangeDatesFromStringToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :proposals, :start_date, :date
    change_column :proposals, :end_date, :date
    change_column :season_rates, :start_date, :date
    change_column :season_rates, :end_date, :date

  end
end
