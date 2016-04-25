module CourseHelper

  def course_order
    Course.order(:name)
  end

end