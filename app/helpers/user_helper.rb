module UserHelper


  def schedule_order(enrollments)
    enrollments.sort_by { |enrollment| enrollment.section.period_id }
  end

  def student_index(student)
    "#{ @students.index(student) + 1 }."
  end



end