class ProfessorsCourses < ActiveRecord::Migration
  def self.up
    create_table :professorscourses do |t|
      t.integer :course_id
      t.integer :professor_id
    end
  end

  def self.down
    drop_table :professorscourses
  end
end
