module RequirementHelper

  def grade_requirements(grade_level)
    Requirement.where(grade_level: grade_level)
  end

  def find_student_requirements(student)
    student_requirements = Requirement.where(grade_level: student.grade_level)
    student_requirements.flatten
  end

  def registered_for_requirement?(student, requirement)
    enrolled_course_names = student.courses.pluck(:name)
    if requirement.course
      if enrolled_course_names.include?(requirement.course.name)
        "Registered"
      else
        "Unregistered"
      end
    end
  end

end