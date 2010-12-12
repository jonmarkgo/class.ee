class School < ActiveRecord::Base
  has_many :departments, :dependent => :destroy
  belongs_to :state
end
