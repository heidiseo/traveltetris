class Booking < ApplicationRecord
  belongs_to :plan
  has_many :flight_bookings, dependent: :destroy
  has_many :flights, through: :flight_bookings
  monetize :amount_cents
end
