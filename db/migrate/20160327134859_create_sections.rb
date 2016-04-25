class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string    :name, null: false
      t.string    :code, null: false
      t.string    :description
      t.integer   :seats
      t.integer   :course_id
      t.integer   :period_id
      t.boolean   :closed, default: false
      t.timestamps null: false
    end
  end
end
