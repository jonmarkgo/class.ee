class Course < ActiveRecord::Base
  has_many :professor_ratings, :dependent => :destroy
  has_and_belongs_to_many :professors
  belons_to :department
end
