class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :user_name
      t.string :email
      t.string :start_date
      t.string :end_date
      t.integer :total_guests
      t.text :purpose
      t.decimal :total_amount

      t.timestamps
    end
  end
end
