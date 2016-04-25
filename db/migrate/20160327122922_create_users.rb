class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :first_name, null: false
      t.string    :last_name, null: false
      t.string    :email, null: false
      t.integer   :id_number
      t.string    :current_homeroom
      t.string    :password_digest
      t.boolean   :admin, default: false
      t.integer   :grade_level, null: false
      t.timestamps null: false
    end
  end
end
