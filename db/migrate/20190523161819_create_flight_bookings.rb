class CreateFlightBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :flight_bookings do |t|
      t.string :first_name_passenger
      t.string :last_name_passenger
      t.string :passport
      t.string :nationality
      t.references :booking, foreign_key: true
      t.references :flight, foreign_key: true

      t.timestamps
    end
  end
end
