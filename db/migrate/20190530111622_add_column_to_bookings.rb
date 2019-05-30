class AddColumnToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :first_name_passenger, :string
    add_column :bookings, :last_name_passenger, :string
    add_column :bookings, :passport, :string
    add_column :bookings, :nationality, :string
    add_column :bookings, :dob, :date
  end
end
