class City < ApplicationRecord
  has_many :plan_cities, dependent: :destroy
  has_many :plans, through: :plan_cities, dependent: :destroy
  has_many :city_plans, class_name: 'Plan', foreign_key: 'city_id', dependent: :destroy
  has_many :departure_flights, class_name: 'Flight', foreign_key: 'departure_city_id', dependent: :destroy
  has_many :arrival_flights, class_name: 'Flight', foreign_key: 'arrival_city_id', dependent: :destroy
  validates :name, :photo, presence: true
end
