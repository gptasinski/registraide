module UserHelper


  def schedule_order(enrollments)
    enrollments.sort_by { |enrollment| enrollment.section.period_id }
  end

  def student_index(student)
    "#{ student_order.index(student) + 1 }."
  end

  def student_order
    all = User.where(admin: false).order(:last_name, :first_name)
  end



end