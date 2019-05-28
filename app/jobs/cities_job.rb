require 'csv'
require 'open-uri'
require 'json'

class CitiesJob < ApplicationJob
  queue_as :default

  def perform
    City.destroy_all
    csv_options = { headers: true }
    filepath = "https://pkgstore.datahub.io/core/world-cities/world-cities_csv/data/6cc66692f0e82b18216a48443b6b95da/world-cities_csv.csv"
    open(filepath) do |f|
      f.each_line do |l|
        CSV.parse(l) do |row|
          unless row[0] == 'name'
            city = City.new(name: row[0])
            url = "https://api.teleport.org/api/urban_areas/slug:#{city.name.gsub(' ', '-')}/images/"
            # binding.pry
            begin
              pictures = open(url)
              photo = pictures['photos'].first['image']['web']
            rescue OpenURI::HTTPError, URI::InvalidURIError
              photo = "https://images.unsplash.com/photo-1500835556837-99ac94a94552?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
            end
            city.photo = photo
            city.save
            puts city
            # if pictures['status'] == 404
            # else
          end
        end
      end
    # CSV.foreach(filepath, csv_options) do |row|
    end
  end
end
