class PlanCity < ApplicationRecord
  belongs_to :plan
  belongs_to :city

end
