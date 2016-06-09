require 'rails_helper'
include CourseHelper

describe "Courses" do
  let(:test_course) { Course.create!(name: "Test Course", number: "ART 101", title: "Testing Course", description: "C'mon big green, no whammies, no whammies, no whammies!", prereq: "none", department_id: nil, diploma_program: false) }
  let(:general_course) { Course.create!(name: "General Course", number: "GEN 101", title: "General Testing Course", description: "All things general.", prereq: "none", department_id: nil, diploma_program: false) }
  let(:third_course) { Course.create!(name: "Course Three", number: "TRD 101", title: "Third Testing Course", description: "The third of things.", prereq: "none", department_id: nil, diploma_program: true) }




  it "has a name" do
    expect(test_course.name).to eq("Test Course")
  end

  it "has a number" do
    expect(test_course.number).to eq("ART 101")
  end

  it "has a title" do
    expect(test_course.title).to eq("Testing Course")
  end

  it "has a description" do
    expect(test_course.description).to eq("C'mon big green, no whammies, no whammies, no whammies!")
  end

  it "has a prereq" do
    expect(test_course.prereq).to eq("none")
  end

  it "has a prereq" do
    expect(test_course.prereq).to eq("none")
  end

  it "has a department_id of nil until saved properly" do
    expect(test_course.department_id).to be nil
  end

  it "has a default of false for diploma program value" do
    expect(test_course.diploma_program).to be false
  end

  describe "#set_department" do
    it "saves a course to the its corresponding department" do
      test_course.save
      test_course.set_department(1)
      expect(test_course.department_id).to eq(1)
    end
  end

  describe "#seats_available" do
    let(:test_section) { Section.create(name: "123", code: "SEC123", description: "123", seats: 123, course_id: test_course.id, period_id: 1, closed: false) }


    it "returns 0 if there are no sections created for the course" do
      expect(general_course.seats_available).to eq(0)
    end

    it "returns 0 if there are no available seats in sections for the course" do
      expect(general_course.seats_available).to eq(0)
    end

    it "returns the number of remaining seats if there are seats available" do
      test_course.sections << test_section
      expect(test_course.seats_available).to eq(123)
    end
  end
end