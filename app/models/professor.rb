class Professor < ActiveRecord::Base
  has_many :professor_ratings, :dependent => :destroy
  has_and_belons_to_many :courses
  belons_to :department
end
