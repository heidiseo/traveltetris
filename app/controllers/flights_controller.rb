require 'json'
require 'open-uri'

class FlightsController < ApplicationController
  skip_before_action :authenticate_user!
  def api
    @plan = Plan.find(params[:plan_id])
    @flights = []
    @plan.trip_dates.each_with_index do |date, index|
      departure = date.departure_date.strftime('%d/%m/%Y')
      arrival = date.arrival_date.strftime('%d/%m/%Y')
      to = @plan.cities[index]
      url = "https://api.skypicker.com/flights?flyFrom=#{@plan.city.name}&to=#{to.name}&date_from=#{departure}&date_to=#{departure}&return_from=#{arrival}&return_to=#{arrival}&max_stopovers=0&sort=price&asc=1&curr=GBP&partner=picky&dtime_from=19:00&dtime_to=00:00&ret_dtime_from=19:00&ret_dtime_to=22:00&limit=1"
      begin
        flight = open(url)
        flight = open(url).read
        @flights << JSON.parse(flight)
      rescue OpenURI::HTTPError, URI::InvalidURIError => e
        puts e.message
      end
    end
    @airlines = JSON.parse(open('db/airline.json').read)
  end
end
