class Flight < ApplicationRecord
  belongs_to :departure_city, class_name: "City"
  belongs_to :arrival_city, class_name: "City"
  has_many :flight_bookings, dependent: :destroy
  validates :departure_city, :departure_date, :arrival_city, :arrival_date, :price, :flight_number, presence: true
  monetize :price_cents
end
