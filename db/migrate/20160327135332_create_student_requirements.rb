class CreateStudentRequirements < ActiveRecord::Migration
  def change
    create_table :student_requirements do |t|
      t.integer   :student_id
      t.integer   :requirement_id
      t.timestamps null: false
    end
  end
end
