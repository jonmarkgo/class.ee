class ProfessorRating < ActiveRecord::Base
  belongs_to :professor
  belongs_to :course
  acts_as_tagger
end
