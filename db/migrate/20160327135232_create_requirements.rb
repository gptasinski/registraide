class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.string    :course_id
      t.string    :grade_level
      t.timestamps null: false
    end
  end
end
