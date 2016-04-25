class StudentRequirement < ActiveRecord::Base
  belongs_to :student
  belongs_to :requirement
end
