class Requirement < ActiveRecord::Base
  belongs_to :course
  has_many :student_requirements
  has_many :students, through: :student_requirements
end
