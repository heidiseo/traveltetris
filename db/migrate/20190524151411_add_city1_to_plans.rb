class AddCity1ToPlans < ActiveRecord::Migration[5.2]
  def change
    add_column :plans, :city1, :string
    add_column :plans, :city2, :string
    add_column :plans, :start_date1, :datetime
    add_column :plans, :end_date1, :datetime
    add_column :plans, :start_date2, :datetime
    add_column :plans, :end_date2, :datetime
  end
end
