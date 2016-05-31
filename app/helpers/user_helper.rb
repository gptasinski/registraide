module UserHelper


  def schedule_order(enrollments)
    enrollments.sort_by { |enrollment| enrollment.section.period_id }
  end

  def master_order(enrollments)
    enrollments.sort_by { |enrollment| enrollment.section.code }
  end

  def student_index(student)
    "#{ ordered_students.index(student) + 1 }."
  end

  def ordered_students
    User.where(admin: false).order(:last_name, :first_name)
  end



end