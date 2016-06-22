module EnrollmentHelper

  def enrolled(user, section_code, course_name)
    enrolled_sections = user.sections.pluck(:code)
    enrolled_courses = user.courses.pluck(:number)
    enrolled_sections.include?(section_code) || enrolled_courses.include?(course_name)
  end

  def period_conflict(user, section_period)
    enrolled_periods = user.sections.pluck(:period_id)
    enrolled_periods.include?(section_period)
  end

  def find_user
    @user = User.find(session[:id])
  end

  def find_course
    @course = Course.find_by(id: params[:course_id])
  end

  def find_section
    @section = Section.find_by(id: params[:section_id])
  end

  def enrollments_period_order(enrollments)
     sections = enrollments.map { |enrollment| enrollment.section }
     sections.sort_by { |section| section.period_id }
  end

  def all_student_sections
    @students = User.where(admin: false)
    @students.map { |student| student.sections }.flatten
  end

  def student_enrollments(student)
    student.enrollments.sort_by { |enrollment| enrollment.section.period_id }
  end

  def all_students_enrollment_order(enrollments)
    enrollments.sort_by { |e| e.student.last_name }
  end

  def enrollment_master_order
    Enrollment.joins(:section).merge(Section.order(:period_id, :name))
  end

end