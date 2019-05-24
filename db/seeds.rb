# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'time'

puts "cleaning"
Flight.destroy_all
City.destroy_all
puts "seeding"

city_one = City.create(name: "Paris")
city_two = City.create(name: "Porto")
city_three = City.create(name: "Amsterdam")
city_four = City.create(name: "Berlin")
city_five = City.create(name: "Dublin")

cities = [city_one, city_five, city_four, city_three, city_two]
departure_city = City.create(name: "London")

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
