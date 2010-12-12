class Department < ActiveRecord::Base
  belongs_to :school
  has_many :courses
  has_many :professors
end
