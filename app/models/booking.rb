class Booking < ApplicationRecord
  belongs_to :plan
  has_many :flight_bookings
end
