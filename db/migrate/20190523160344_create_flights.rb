class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :departure_date
      t.datetime :arrival_date
      t.string :flight_number
      t.string :photo
      t.monetize :price

      t.references :departure_city
      t.references :arrival_city
      t.timestamps
    end

    add_foreign_key :flights, :cities, column: :departure_city_id, primary_key: :id
    add_foreign_key :flights, :cities, column: :arrival_city_id, primary_key: :id
  end
end
