class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string :name
      t.integer :state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :schools
  end
end
