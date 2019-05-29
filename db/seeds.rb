require 'time'
require 'open-uri'
require 'json'

puts "cleaning"
Flight.destroy_all
City.destroy_all
puts "seeding"

cities = ["Amsterdam", "Bali", "Barcelona", "Belo Horizonte", "Berlin", "Bordeaux", "Brussels", "Buenos Aires", "Cali", "Casablanca","Chengdu","Copenhagen","Kyoto","Lausanne","Lille","Lisbon","London","Lyon","Marseille","Melbourne","Mexico","Milan","Montréal","Nantes","Paris","Rio de Janeiro","São Paulo","Shanghai","Shenzhen","Tel Aviv","Tokyo"];

cities.count.times do |x|
  city = City.new(name: "#{cities[x]}")
  url = "https://api.teleport.org/api/urban_areas/slug:#{city.name.gsub(' ', '-')}/images/"
  begin
    pictures = open(url)
    photo = pictures['photos'].first['image']['web']
  rescue OpenURI::HTTPError, URI::InvalidURIError
    photo = "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
  end
  city.photo = photo
  city.save
  puts city
end

puts "cities created"

departure_city = City.first

puts "flight 1"

flight_one = Flight.create(
  departure_city: departure_city,
  arrival_city: City.all.sample,
  departure_date: Time.new(2019, 6, 4, 20, 0),
  arrival_date: Time.new(2019, 6, 7, 20, 0),
  price: 100,
  flight_number: "ABCD"
  )

puts "flight 2"

flight_two = Flight.create(
  departure_city: departure_city,
  arrival_city: City.all.sample,
  departure_date: Time.new(2019, 7, 7, 20, 0),
  arrival_date: Time.new(2019, 7, 10, 10, 0),
  price: 80,
  flight_number: "EF4F"
  )

puts "flight 3"

flight_three = Flight.create(
  departure_city: departure_city,
  arrival_city: City.all.sample,
  departure_date: Time.new(2019, 8, 7, 20, 0),
  arrival_date: Time.new(2019, 8, 11, 20, 0),
  price: 50,
  flight_number: "EF366"
  )

puts "flight 4"

  flight_four = Flight.create(
  departure_city: departure_city,
  arrival_city: City.all.sample,
  departure_date: Time.new(2019, 8, 15, 20, 0),
  arrival_date: Time.new(2019, 8, 18, 20, 0),
  price: 150,
  flight_number: "Fh76O"
  )

puts "flight 5"

  flight_five = Flight.create(
  departure_city: departure_city,
  arrival_city: City.all.sample,
  departure_date: Time.new(2019, 6, 20, 20, 0),
  arrival_date: Time.new(2019, 6, 23, 20, 0),
  price: 170,
  flight_number: "MN890"
  )


  puts "finished!"

