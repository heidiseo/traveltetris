class Plan < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :plan_cities, dependent: :destroy
  has_many :cities, through: :plan_cities
  has_many :trip_dates, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :flight_bookings, through: :bookings
end
