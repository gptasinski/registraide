class Enrollment < ActiveRecord::Base
  belongs_to :section
  belongs_to :student, class_name: :User
  # belongs_to :course
  belongs_to :department

  def pluck_dept
    self.section.code
  end
end
