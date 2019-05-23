class CreateTripDates < ActiveRecord::Migration[5.2]
  def change
    create_table :trip_dates do |t|
      t.references :plan, foreign_key: true
      t.datetime :departure_date
      t.datetime :arrival_date

      t.timestamps
    end
  end
end
