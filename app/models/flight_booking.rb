class FlightBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :flight
  validates :first_name_passenger, :last_name_passenger, :passport, :nationality, presence: true
end
