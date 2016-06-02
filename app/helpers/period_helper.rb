module PeriodHelper

  def all_sections
    periods = Period.all
    sections = periods.map { |period| period.sections }
    sections.flatten
  end


  # this follwing method is really for sections should be in sectionhelpers
  def by_period_order(sections)
    sections.sort_by { |sec| sec.course.department.name }
  end

end