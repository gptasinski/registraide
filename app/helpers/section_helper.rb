module SectionHelper

  def sections_order(sections)
    sections.order(:code)
  end

  def sections_department_order(sections)
    sections.order(:code)
  end

  def sections_period_order(sections)
    period_order = sections.order(:period_id)
    alphabeltical_period_order = period_order.order(:code)
  end

  def sections_by_course_name(sections)
    sections.sort_by { |section| section.course.name }
  end

  def possible_seats(section)
    section.seats + section.students.count
  end
end