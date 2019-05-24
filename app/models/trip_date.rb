class TripDate < ApplicationRecord
  belongs_to :plan
  validates :departure_date, :arrival_date, presence: true
end
