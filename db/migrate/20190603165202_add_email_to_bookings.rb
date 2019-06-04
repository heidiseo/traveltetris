class AddEmailToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :email, :string
  end
end
