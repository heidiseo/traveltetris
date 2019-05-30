class RemoveColumnFromPlans < ActiveRecord::Migration[5.2]
  def change
    remove_column :plans, :city1
    remove_column :plans, :city2
    remove_column :plans, :start_date1
    remove_column :plans, :start_date2
    remove_column :plans, :end_date1
    remove_column :plans, :end_date2
  end
end
