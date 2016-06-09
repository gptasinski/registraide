module UserHelper


  def schedule_order(enrollments)
    enrollments.sort_by { |enrollment| enrollment.section.period_id }
  end

  def student_index(students, student)
    "#{ student_order(students).index(student) + 1 }."
  end

  def student_order(students)
    students.order(:last_name, :first_name)
  end

  def reset_user_sections(user)
    sections = user.sections
    sections.each do |sec|
      sec.reset_section
    end
  end



end