class Booking < ApplicationRecord
  belongs_to :plan
  has_many :flight_bookings, dependent: :destroy
  # validates :first_name_passenger, :last_name_passenger, :passport, :nationality, presence: true
  monetize :amount_cents
end
