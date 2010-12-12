class CreateProfessors < ActiveRecord::Migration
  def self.up
    create_table :professors do |t|
      t.integer :department_id
      t.string :office_building
      t.string :office_room
      t.string :firstname
      t.string :lastname
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :professors
  end
end
