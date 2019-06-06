class AddFullDateToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :full_departure_date, :string
    add_column :flights, :full_arrival_date, :string


  end
end
