require 'rails_helper'

describe "Enrollment" do
  let(:user) { User.create(first_name: "Rod", last_name: "Stewart", email: "hair@cps.edu", id_number: 23232, password: "123", current_homeroom: "nothing", grade_level: 9)}
  let(:section) { Section.create(name: "Rock", code: "0410ART-8", description: "Discussing the differences between stones and rocking", seats: 3, course_id: 1, period_id: 8)}
  let(:first) { Enrollment.create(student_id: user.id, section_id: section.id)}

  it "has a non nil value for its student id attribute" do
    expect(first.student_id).to eq(user.id)
  end

  it "has a non nil valie for its section id attribute" do
    expect(first.section_id).to eq(section.id)
  end

  it "is created with a nil value for its semester attribute " do
    expect(first.semester).to eq(nil)
  end

  it "is created with a true value for its active attribute" do
    expect(first.active).to be(true)
  end

  describe ".pluck_dept" do
    it "returns the section code associated with the enrollment" do
      expect(first.pluck_dept).to eq("0410ART-8")
    end
  end

end