class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.datetime :starting_at
      t.text :location
      t.text :description
      t.string :reference
      t.references :seat

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
