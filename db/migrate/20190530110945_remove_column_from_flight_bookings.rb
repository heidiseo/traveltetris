class RemoveColumnFromFlightBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :flight_bookings, :first_name_passenger
    remove_column :flight_bookings, :last_name_passenger
    remove_column :flight_bookings, :passport
    remove_column :flight_bookings, :nationality
    remove_column :flight_bookings, :dob
  end
end
