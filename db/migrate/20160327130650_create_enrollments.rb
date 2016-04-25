class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer   :student_id, null: false
      t.integer   :section_id, null: false
      t.string    :semester
      t.boolean   :active, default: true
      t.timestamps null: false
    end
  end
end
