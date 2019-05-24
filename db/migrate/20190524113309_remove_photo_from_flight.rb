class RemovePhotoFromFlight < ActiveRecord::Migration[5.2]
  def change
    remove_column :flights, :photo, :string
  end
end
