require 'json'
require 'open-uri'

class FlightsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def api
    skip_authorization
    @plan = Plan.find(params[:plan_id])
    @going_flights = {}
    @returning_flights = {}
    @plan.trip_dates.each_with_index do |date, index|
      departure = date.departure_date.strftime('%d/%m/%Y')
      arrival = date.arrival_date.strftime('%d/%m/%Y')
      begin
        @plan.cities.each do |city|
          to = city
          url = "https://api.skypicker.com/flights?flyFrom=#{@plan.city.name}&to=#{to.name}&date_from=#{departure}&date_to=#{departure}&return_from=#{arrival}&return_to=#{arrival}&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
          response = open(url)
          response = JSON.parse(response.read)
          data = response['data']
          if data.any?
            flight_info = data.first['route']
            price = response['data'].first['price']
            flight_info.each do |route|
              departure_city = City.find_by(name: route['cityFrom'].capitalize) || City.create(name: route['cityFrom'].capitalize)
              arrival_city = City.find_by(name: route['cityTo'].capitalize) || City.create(name: route['cityTo'].capitalize)
              dep_time = route["dTime"]
              dep_time_format = DateTime.strptime(dep_time.to_s,'%s')
              arr_time = route["aTime"]
              arr_time_format = DateTime.strptime(arr_time.to_s,'%s')
              flight = Flight.find_by(departure_city: departure_city, departure_date: date.departure_date, arrival_city: arrival_city, arrival_date: date.arrival_date, price_cents: price, flight_number: route['flight_no']) || Flight.create(departure_city: departure_city, departure_date: date.departure_date, arrival_city: arrival_city, arrival_date: date.arrival_date, price_cents: price, flight_number: route['flight_no'], full_departure_date: dep_time_format, full_arrival_date: arr_time_format)

              if route['return'] == 1
                if @returning_flights[flight.arrival_date.to_s]
                  @returning_flights[flight.arrival_date.to_s] << flight
                else
                  @returning_flights[flight.arrival_date.to_s] = [flight]
                end
              else
                if @going_flights[flight.departure_date.to_s]
                  @going_flights[flight.departure_date.to_s] << flight
                else
                  @going_flights[flight.departure_date.to_s] = [flight]
                end
              end
            end

            # combinations => array of arrays
            # each combination will be an element of the combination array
            # each combination has flights instances
            # can't have combination with flights with same location
            # get the first flight in the first key and go to the next keys and
            # find a different flight

            # flight_in_first_column = ""
            # flight_in_second_column = ""
            # counter = 0
            # @going_flights.each do |d, flights|
            #   arrOfArrFlights << flights
            # end

            # arrOfArrFlights.each do |arr_flights|
            #   arr_flights
            # end


            # @combinations = []
            # array_of_flights = @going_flights.values
            # @going_flights.each do |d, flights|
            #   @comb = []
            #   # @comb << d.flights.select(flight) unless c
            #   # @comb << flight unless @comb[d.flights.first]
            #   # @comb << d.flights.reject { |flight| IT ALREADY EXISTS}
            #   flights.each do |flight|
            #     @comb << flight unless @comb[flight]
            #   end
            # end
            # @combinations << @comb

            # array_of_flights.each do |flights_at_date|
            #   flights_at_date.each do |flight|
            #     other_flights = flights_at_date - [flight]
            #     sum = flight.price_cents + other_flights.each do |other_flight|
            #       other_flight.price_cents
            #     end
            #   end
            # end

          else
            @warning = 'No flights found'
          end
        end
      rescue OpenURI::HTTPError, URI::InvalidURIError => e
        puts e.message
      end
    end
    @airlines = JSON.parse(open('db/airline.json').read)
    # binding.pry
  end

  def show
  end
end
