require 'json'
require 'open-uri'

class FlightsController < ApplicationController
  skip_before_action :authenticate_user!
  def api
    skip_authorization
    url = "https://api.skypicker.com/flights?flyFrom=london&to=paris&dateFrom=18/06/2019&dateTo=20/06/2019&partner=picky"
    flights = open(url).read
    @flight_search = JSON.parse(flights)
  end
end
