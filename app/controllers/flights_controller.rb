require 'json'
require 'open-uri'

class FlightsController < ApplicationController
  skip_before_action :authenticate_user!
  def api
    skip_authorization
    url = "https://api.skypicker.com/flights?flyFrom=london&to=paris&date_from=18/06/2019&date_to=18/06/2019&return_from=20/06/2019&return_to=20/06/2019&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=17:00&ret_dtime_to=20:00&limit=1"
    flights = open(url).read
    @flight_search = JSON.parse(flights)
  end
end
