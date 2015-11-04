class RemoveLatitudeAndLongitudeFromLocation < ActiveRecord::Migration
  def change
    remove_column :locations, :latitude, :integer
    remove_column :locations, :longitude, :integer
  end
end
