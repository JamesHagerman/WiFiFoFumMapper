class AddCoordsToAccessPoints < ActiveRecord::Migration
  def change
    add_column :access_points, :latitude, :decimal, :precision => 15, :scale => 12
    add_column :access_points, :longitude, :decimal, :precision => 15, :scale => 12
    add_column :access_points, :altitude, :decimal, :precision => 15, :scale => 12
  end
end
