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

    url_three = "https://api.skypicker.com/flights?flyFrom=london&to=paris&date_from=12/07/2019&date_to=12/07/2019&return_from=14/07/2019&return_to=14/07/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    flights_three = open(url_three).read
    flight_search_three = JSON.parse(flights_three)

    # url_four = "https://api.skypicker.com/flights?flyFrom=london&to=barcelona&date_from=14/06/2019&date_to=14/06/2019&return_from=17/06/2019&return_to=17/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    # flights_four = open(url_four).read
    # flight_search_four = JSON.parse(flights_four)

    # url_five = "https://api.skypicker.com/flights?flyFrom=london&to=barcelona&date_from=28/06/2019&date_to=28/06/2019&return_from=30/06/2019&return_to=30/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    # flights_five = open(url_five).read
    # flight_search_five = JSON.parse(flights_five)

    # url_six = "https://api.skypicker.com/flights?flyFrom=london&to=barcelona&date_from=12/07/2019&date_to=12/07/2019&return_from=14/07/2019&return_to=14/07/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    # flights_six = open(url_six).read
    # flight_search_six = JSON.parse(flights_six)

    # url_seven = "https://api.skypicker.com/flights?flyFrom=london&to=vienna&date_from=14/06/2019&date_to=14/06/2019&return_from=17/06/2019&return_to=17/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    # flights_seven = open(url_seven).read
    # flight_search_seven = JSON.parse(flights_seven)

    # url_eight = "https://api.skypicker.com/flights?flyFrom=london&to=vienna&date_from=28/06/2019&date_to=28/06/2019&return_from=30/06/2019&return_to=30/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    # flights_eight = open(url_eight).read
    # flight_search_eight = JSON.parse(flights_eight)

    # url_nine = "https://api.skypicker.com/flights?flyFrom=london&to=vienna&date_from=12/07/2019&date_to=12/07/2019&return_from=14/07/2019&return_to=14/07/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
    # flights_nine = open(url_nine).read
    # flight_search_nine = JSON.parse(flights_nine)

    # @flight_search = [flight_search_one, flight_search_two, flight_search_three, flight_search_four, flight_search_five, flight_search_six, flight_search_seven, flight_search_eight, flight_search_nine]
    @flight_search = [flight_search_one, flight_search_two, flight_search_three]
  end
end
