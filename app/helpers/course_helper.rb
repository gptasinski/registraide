module CourseHelper

  def course_order
    Course.order(:name)
  end

  def course_show_order(section)
    section.order(:period_id, :name)
  end

end