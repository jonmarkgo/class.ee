class AddRatingVotes < ActiveRecord::Migration
  def self.up
    add_column :professor_ratings, :upvotes, :integer, :default => 0
    add_column :professor_ratings, :downvotes, :integer, :default => 0
  end

  def self.down
    remove_column :professor_ratings, :upvotes
    remove_column :professor_ratings, :downvotes
  end
end
