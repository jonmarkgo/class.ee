class Professor < ActiveRecord::Base
  has_many :professor_ratings, :dependent => :destroy
  has_and_belongs_to_many :courses
  belongs_to :department
  acts_as_taggable_on :tags
end
