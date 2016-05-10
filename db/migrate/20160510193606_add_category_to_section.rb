class AddCategoryToSection < ActiveRecord::Migration
  def change
    add_column :sections, :category, :string
  end
end
