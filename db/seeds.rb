require 'time'
require 'open-uri'
require 'json'

puts "cleaning"
Flight.destroy_all
City.destroy_all
puts "seeding"

# cities = ["Amsterdam", "Bali", "Barcelona", "Belo Horizonte", "Berlin", "Bordeaux", "Brussels", "Buenos Aires", "Cali", "Casablanca","Chengdu","Copenhagen","Kyoto","Lausanne","Lille","Lisbon","London","Lyon","Marseille","Melbourne","Mexico","Milan","Montréal","Nantes","Paris","Rio de Janeiro","São Paulo","Shanghai","Shenzhen","Tel Aviv","Tokyo"];
# cities = ['Alicante', 'Amsterdam', 'Athens', 'Barcelona', 'Bari', 'Basel', 'Belfast', 'Belgrade', 'Bergen', 'Berlin', 'Bilbao', 'Birmingham', 'Bologna', 'Bordeaux', 'Bristol', 'Brussels', 'Bucharest', 'Budapest', 'Cagliari', 'Catania', 'Charleroi', 'Cologne', 'Copenhagen', 'Derby', 'Dublin', 'Düsseldorf', 'Edinburgh', 'Eindhoven', 'Faro', 'Frankfurt', 'Gdańsk', 'Geneva', 'Glasgow', 'Gothenburg', 'Hamburg', 'Hanover', 'Helsinki', 'Heraklion', 'Ibiza', 'Istanbul', 'Katowice', 'Kiev', 'Kraków', 'Krasnodar', 'Lisbon', 'Liverpool', 'London', 'Lyon', 'Madrid', 'Málaga', 'Malta', 'Manchester', 'Marseille', 'Milan', 'Minsk', 'Moscow', 'Munich', 'Nantes', 'Naples', 'Nice', 'Nuremberg', 'Oslo', 'Palermo', 'Palma de Mallorca', 'Paris', 'Pisa', 'Porto', 'Prague', 'Reykjavík', 'Rhodes', 'Riga', 'Rome', 'Saint Petersburg', 'Seville', 'Simferopol', 'Sofia', 'Stavanger', 'Stockholm', 'Stuttgart', 'Thessaloniki', 'Toulouse', 'Trondheim', 'Valencia', 'Venice', 'Vienna', 'Vilnius', 'Warsaw', 'Zürich']
cities = { 'Amsterdam' => 'AMS', 'Barcelona' => 'BCN', 'Basel' => 'BSL', 'Belfast' => 'BFS', 'Berlin' => 'TXL' , 'Bilbao' => 'BIO', 'Bologna' => 'BLQ', 'Bordeaux' => 'BOD', 'Brussels' => 'BRU', 'Bucharest' => 'OTP', 'Budapest' => 'BOD', 'Cologne' => 'CGN', 'Copenhagen' => 'CPH', 'Dublin' => 'DUB', 'Düsseldorf' => 'DUS', 'Edinburgh' => 'EDI', 'Frankfurt' => 'FRA', 'Geneva' => 'GVA', 'Glasgow' => 'GLA', 'Hamburg' => 'HAM', 'Helsinki' => 'HEL', 'Ibiza' => 'IBZ', 'Istanbul' => 'IST', 'Kiev' => 'KBP', 'Kraków' => 'KRK', 'Lisbon' => 'LIS', 'London' => 'STN', 'Lyon' => 'LYS', 'Madrid' => 'MAD', 'Málaga' => 'AGP', 'Malta' => 'MLA', 'Milan' => 'MXP', 'Munich' => 'MUC', 'Naples' => 'NAP', 'Nice' => 'NCE', 'Oslo' => 'OSL', 'Palermo' => 'PMO', 'Paris' => 'CDG', 'Pisa' => 'PSA', 'Porto' => 'OPO', 'Prague' => 'PRG', 'Reykjavík' => 'KEF', 'Riga' => 'RIX', 'Rome' => 'FCO', 'Seville' => 'SVQ', 'Sofia' => 'SOF', 'Stockholm' => 'ARN', 'Stuttgart' => 'STR', 'Valencia' => 'VLC', 'Venice' => 'VCE', 'Vienna' => 'VIE', 'Vilnius' => 'VNO', 'Warsaw' => 'WAW', 'Zürich' => 'ZRH'}
# cities.count.times do |x|
#   city = City.new(name: "#{cities[x]}")
#   url = "https://api.teleport.org/api/urban_areas/slug:#{city.name.gsub(' ', '-')}/images/"
#   begin
#     pictures = open(url)
#     photo = pictures['photos'].first['image']['web']
#   rescue OpenURI::HTTPError, URI::InvalidURIError
#     photo = "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
#   end
#   city.photo = photo
#   city.save
#   puts city.name
# end

cities.each do |city, code|
  city = City.new(name: "#{city}", airport_code: "#{code}")
  url = "https://api.teleport.org/api/urban_areas/slug:#{city.name.gsub(' ', '-')}/images/"
  begin
    pictures = open(url)
    photo = pictures['photos'].first['image']['web']
  rescue OpenURI::HTTPError, URI::InvalidURIError
    photo = "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
  end
  city.photo = photo
  city.save
  puts city.name

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

  puts "creating plan"

  @plan = Plan.create(user: User.first, city: City.first)
  puts "creating booking"

  @booking = Booking.create(plan: @plan, first_name_passenger: "bob", last_name_passenger: "harrow", email: "bobharrow@gmail.com", amount_cents: 500)
  puts "creating flight booking"
  @flight_booking = FlightBooking.create(booking: Booking.first, flight: flight_one )
  @flight_booking2 = FlightBooking.create(booking: Booking.first, flight: flight_two )
  @flight_booking3 = FlightBooking.create(booking: Booking.first, flight: flight_three )
  @flight_booking4 = FlightBooking.create(booking: Booking.first, flight: flight_four )
  @flight_booking5 = FlightBooking.create(booking: Booking.first, flight: flight_five )

  puts "finished!"
