class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.string :name
      t.string :party
      t.string :code
      t.string :image
      t.string :party_code
      t.references :seat
      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
