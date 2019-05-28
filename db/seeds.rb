require 'time'

puts "cleaning"
Flight.destroy_all
City.destroy_all
puts "seeding"

cities = ["Amsterdam", "Bali", "Barcelona", "Belo Horizonte", "Berlin", "Bordeaux", "Brussels", "Buenos Aires", "Cali", "Casablanca","Chengdu","Copenhagen","Kyoto","Lausanne","Lille","Lisbon","London","Lyon","Marseille","Melbourne","Mexico","Milan","Montréal","Nantes","Paris","Rio de Janeiro","São Paulo","Shanghai","Shenzhen","Tel Aviv","Tokyo"];

10.times do |x|
  City.create(name: "#{cities[x]}")
end

departure_city = City.first

flight_one = Flight.create(
  departure_city: departure_city,
  arrival_city: cities.sample,
  departure_date: Time.new(2019, 6, 4, 20, 0),
  arrival_date: Time.new(2019, 6, 7, 20, 0),
  price: 100,
  flight_number: "ABCD"
  )


flight_two = Flight.create(
  departure_city: departure_city,
  arrival_city: cities.sample,
  departure_date: Time.new(2019, 7, 7, 20, 0),
  arrival_date: Time.new(2019, 7, 10, 10, 0),
  price: 80,
  flight_number: "EF4F"
  )

flight_three = Flight.create(
  departure_city: departure_city,
  arrival_city: cities.sample,
  departure_date: Time.new(2019, 8, 7, 20, 0),
  arrival_date: Time.new(2019, 8, 11, 20, 0),
  price: 50,
  flight_number: "EF366"
  )

  flight_four = Flight.create(
  departure_city: departure_city,
  arrival_city: cities.sample,
  departure_date: Time.new(2019, 8, 15, 20, 0),
  arrival_date: Time.new(2019, 8, 18, 20, 0),
  price: 150,
  flight_number: "Fh76O"
  )

  flight_five = Flight.create(
  departure_city: departure_city,
  arrival_city: cities.sample,
  departure_date: Time.new(2019, 6, 20, 20, 0),
  arrival_date: Time.new(2019, 6, 23, 20, 0),
  price: 170,
  flight_number: "MN890"
  )


  puts "finished!"

