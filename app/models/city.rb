class City < ApplicationRecord
  has_many :plan_cities
  has_many :plans
  has_many :departure_flights, class_name: 'Flight', foreign_key: 'departure_city_id'
  has_many :arrival_flights, class_name: 'Flight', foreign_key: 'arrival_city_id'
  validates :name, :photo, presence: true
end
