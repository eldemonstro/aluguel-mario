class CreateUnavailableDates < ActiveRecord::Migration[5.1]
  def change
    create_table :unavailable_dates do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
