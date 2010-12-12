class CreateProfessorRatings < ActiveRecord::Migration
  def self.up
    create_table :professor_ratings do |t|
      t.string :comments
      t.integer :firstname
      t.integer :knowledge
      t.integer :engagement
      t.integer :curriculum
      t.integer :openness
      t.integer :officehelp
      t.integer :assignments
      t.integer :clarity
      t.integer :fun
      t.integer :caring
      t.integer :course_id
      t.integer :professor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :professor_ratings
  end
end
