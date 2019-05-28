require 'json'
require 'open-uri'

class FlightsController < ApplicationController
  skip_before_action :authenticate_user!
  def api
    skip_authorization
    url_one = "https://api.skypicker.com/flights?flyFrom=london&to=paris&date_from=14/06/2019&date_to=14/06/2019&return_from=17/06/2019&return_to=17/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    flights_one = open(url_one).read
    flight_search_one = JSON.parse(flights_one)

    url_two = "https://api.skypicker.com/flights?flyFrom=london&to=paris&date_from=28/06/2019&date_to=28/06/2019&return_from=30/06/2019&return_to=30/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    flights_two = open(url_two).read
    flight_search_two = JSON.parse(flights_two)

    url_three = "https://api.skypicker.com/flights?flyFrom=london&to=barcelona&date_from=14/06/2019&date_to=14/06/2019&return_from=17/06/2019&return_to=17/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    flights_three = open(url_three).read
    flight_search_three = JSON.parse(flights_three)

    url_four = "https://api.skypicker.com/flights?flyFrom=london&to=barcelona&date_from=28/06/2019&date_to=28/06/2019&return_from=30/06/2019&return_to=30/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    flights_four = open(url_four).read
    flight_search_four = JSON.parse(flights_four)

    @flight_search = [flight_search_one, flight_search_two, flight_search_three, flight_search_four]
  end
end
