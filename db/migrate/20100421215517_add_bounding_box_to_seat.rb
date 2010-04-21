class AddBoundingBoxToSeat < ActiveRecord::Migration
  def self.up
    add_column :seats, :min_lat, :float
    add_column :seats, :max_lat, :float
    add_column :seats, :min_lon, :float
    add_column :seats, :max_lon, :float
  end

  def self.down
    remove_column :seats, :max_lon
    remove_column :seats, :min_lon
    remove_column :seats, :max_lat
    remove_column :seats, :min_lat
  end
end
