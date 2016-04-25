require 'rails_helper'


describe 'Section' do
  let (:monday_course) { Course.create!(name: "beginners lab", number: "BIO 99", title: "Cutting", description: "resisting the urge to vomit in the name of science", prereq: "none", department_id: 1, diploma_program: false) }
  let(:monday) { Section.create!(name: "Hearts, Livers and Kidneys", code: "0099BIO-1", description: "Cutting up the vital organs of critters and the like.", seats: 1, course_id: monday_course.id, period_id: 1, closed: false ) }
  let(:tuesday) { Section.create!(name: "Hearts, Livers and Kidneys", code: "0099BIO-2", description: "Cutting up the vital organs of critters and the like.", seats: 0, course_id: monday_course.id, period_id: 2, closed: true ) }
  let(:wednesday) { Section.create!(name: "Hearts, Livers and Kidneys", code: "0099BIO-3", description: "Cutting up the vital organs of critters and the like.", seats: 0, course_id: monday_course.id, period_id: 3, closed: false ) }


  it "has a name" do
    expect(monday.name).to eq("Hearts, Livers and Kidneys")
  end

  it "has a code" do
    expect(monday.code).to eq("0099BIO-1")
  end

  it "has a description" do
    expect(monday.description).to eq("Cutting up the vital organs of critters and the like.")
  end

  it "has an amount of seats" do
    expect(monday.seats).to eq(1)
  end

  it "is associated with a specific course" do
    expect(monday.course_id).to eq(monday_course.id)
  end

  it "is associated with a specific period" do
    expect(monday.period_id).to eq(1)
  end

  it "has a value for its closed status" do
    expect(monday.closed).to be false
  end

  describe "#status" do
    it "returns 'OPEN' if the section is not closed" do
      expect(monday.status).to eq("OPEN")
    end
    it "returns 'CLOSED' if the section is closed" do
      expect(tuesday.status).to eq("CLOSED")
    end
  end

  describe "#set_closed" do
    it "sets closed to false if there are no seats reamaining in the section" do
      wednesday.set_closed
      expect(wednesday.closed).to be true
    end

    it "does not set closed to true if the section has remaining seats" do
      monday.set_closed
      expect(monday.closed).to be false
    end
  end

  describe "#reset_seats" do
    it "increases the seat count of the section by 1" do
      expect { wednesday.reset_seats } .to change{wednesday.seats}.by(1)
    end
  end

  describe "#reset_section" do
    context "when a student drops a section" do
      it "increases the seat count of the section by 1" do
        expect { tuesday.reset_section }.to change{tuesday.seats}.from(0).to(1)
      end
      it "if the section was closed before it was dropped by the student the closed value is reset to false" do
        expect { tuesday.reset_section }.to change{tuesday.closed}.from(true).to(false)
      end
    end
  end

describe "#check_section_seats" do
  context "when there is 1 remaining seat in the section" do
    it "decreases the seat count by 1" do
      expect { monday.check_section_seats }.to change{monday.seats}.from(1).to(0)
    end
    it "sets the value of closed to true" do
      expect { monday.check_section_seats }.to change{monday.closed}.from(false).to(true)
    end
  end
end

end