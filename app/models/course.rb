class Course < ActiveRecord::Base
  has_many :sections, dependent: :destroy
  has_many :enrollments, through: :sections, dependent: :destroy
  has_many :students, through: :enrollments
  has_one  :requirement
  belongs_to :department


  def seats_available
    section_seats = self.sections.pluck(:seats)
    total_seats = section_seats.reduce { |sum, seat| sum + seat }
    total_seats && total_seats > 0 ? total_seats : 0
  end

  def set_department(params)
    self.department_id = params
    self.save
  end

end
