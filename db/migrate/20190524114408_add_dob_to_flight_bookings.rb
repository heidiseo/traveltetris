class AddDobToFlightBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :flight_bookings, :dob, :date
  end
end
