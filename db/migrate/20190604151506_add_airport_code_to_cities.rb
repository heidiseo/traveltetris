class AddAirportCodeToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :airport_code, :string
  end
end
