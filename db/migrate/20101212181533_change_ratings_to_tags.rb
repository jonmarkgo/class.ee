class ChangeRatingsToTags < ActiveRecord::Migration
  def self.up
    remove_column :professor_ratings, :firstname
    remove_column :professor_ratings, :knowledge
    remove_column :professor_ratings, :engagement
    remove_column :professor_ratings, :curriculum
    remove_column :professor_ratings, :openness
    remove_column :professor_ratings, :officehelp
    remove_column :professor_ratings, :assignments
    remove_column :professor_ratings, :clarity
    remove_column :professor_ratings, :fun
    remove_column :professor_ratings, :caring
  end

  def self.down
    add_column :professor_ratings, :firstname, :integer
    add_column :professor_ratings, :knowledge, :integer
    add_column :professor_ratings, :engagement, :integer
    add_column :professor_ratings, :curriculum, :integer
    add_column :professor_ratings, :openness, :integer
    add_column :professor_ratings, :officehelp, :integer
    add_column :professor_ratings, :assignments, :integer
    add_column :professor_ratings, :clarity, :integer
    add_column :professor_ratings, :fun, :integer
    add_column :professor_ratings, :caring, :integer
  end
end
