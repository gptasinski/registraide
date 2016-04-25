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

  def set_department
    case
    when self.number.include?("ART") then self.department_id = 1
    when self.number.include?("MTH") then self.department_id = 2
    when self.number.include?("SCI") then self.department_id = 3
    when self.number.include?("IAS") then self.department_id = 4
    when self.number.include?("LAS") then self.department_id = 5
    when self.number.include?("ENG") then self.department_id = 6
    when self.number.include?("PED") then self.department_id = 7
    else
      self.department_id = 8
    end
  end

end
