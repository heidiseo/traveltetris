class Flight < ApplicationRecord
  belongs_to :departure_city, class_name: "City"
  belongs_to :arrival_city, class_name: "City"
  has_many :flight_bookings
end
