class ProfessorRating < ActiveRecord::Base
  belongs_to :professor
  belongs_to :course
  acts_as_tagger
  
  validates_presence_of :comments
  validates_presence_of :professor
  validates_presence_of :course
  validates_associated :professor
  validates_associated :course
end
