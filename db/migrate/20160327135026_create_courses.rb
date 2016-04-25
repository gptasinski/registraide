class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string    :name, null: false
      t.string    :number, null: false
      t.string    :title
      t.text      :description
      t.string    :prereq
      t.integer   :department_id
      t.boolean   :diploma_program, default: false
      t.timestamps null: false
    end
  end
end
