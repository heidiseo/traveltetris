class CreatePlanCities < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_cities do |t|
      t.references :plan, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
