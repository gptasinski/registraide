module PeriodHelper

  def all_sections
    periods = Period.all
    sections = periods.map { |period| period.sections }
    sections.flatten
  end

end