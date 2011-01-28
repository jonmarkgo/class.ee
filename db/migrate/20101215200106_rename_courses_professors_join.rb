class RenameCoursesProfessorsJoin < ActiveRecord::Migration
  def self.up
    drop_table :professorscourses
    create_table :courses_professors, :id => false do |t|
      t.integer :course_id
      t.integer :professor_id
    end    
  end

  def self.down
    create_table :professorscourses do |t|
      t.integer :course_id
      t.integer :professor_id
    end
    drop_table :courses_professors
  end
end
