require 'rails_helper'
include UserHelper

describe "User" do
  let(:student) { User.create!(first_name: "Eric",
                                last_name: "Clapton",
                                email: "clapton@cps.edu",
                                id_number: 405,
                                current_homeroom: "Mr. Keating",
                                password: "123",
                                grade_level: 10) }
  let(:course) { Course.create!(name: "Brains",
                                  number: "BR_101",
                                  title: "Working It",
                                  description: "Brain exercises",
                                  department_id: 1,
                                  diploma_program: false) }
  let(:section_one) { Section.create!(name: "Art 101",
                                  code: "ART101-1" ,
                                  description: "sharpening pencils",
                                  seats: 3,
                                  course_id: course.id,
                                  period_id: 1,
                                  closed: false) }
  let(:section_two) { Section.create!(name: "Math 101",
                                  code: "MTH101-2" ,
                                  description: "calculators",
                                  seats: 3,
                                  course_id: course.id,
                                  period_id: 2,
                                  closed: false) }
  let(:section_three) { Section.create!(name: "Bio 101",
                                  code: "BIO101-3" ,
                                  description: "boring",
                                  seats: 3,
                                  course_id: course.id,
                                  period_id: 3,
                                  closed: false) }
  let(:class_one) { Enrollment.create!(student_id: student_id,
                                        section_id: 1,
                                        semester: "Spring",
                                        active: true) }
  let(:class_two) { Enrollment.create!(student_id: student_id,
                                        section_id: section_two.id,
                                        semester: "Spring",
                                        active: true) }
  let(:class_three) { Enrollment.create!(student_id: student_id,
                                        section_id: section_three.id,
                                        semester: "Spring",
                                        active: true) }
  it "has an id" do
    expect(student.id).to_not be(nil)
  end

  it "has a first_name" do
    expect(student.first_name).to eq("Eric")
  end

  it "has a last_name" do
    expect(student.last_name).to eq("Clapton")
  end

  it "has a valid email" do
    domain = student.email[-7..-1]
    expect(domain).to eq("cps.edu")
  end

  it "has an id number" do
    expect(student.id_number).to eq(405)
  end

  it "has a current homeroom number" do
    expect(student.current_homeroom).to eq("Mr. Keating")
  end

  it "has a password" do
    expect(student.password).to_not be nil
  end

  it "has a grade level" do
    expect(student.grade_level).to be(10)
  end



end