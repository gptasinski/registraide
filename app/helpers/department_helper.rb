module DepartmentHelper

  def department_order
    Department.all.order(:name)
  end

  def department_show_order(sections)
    sections.order(:period_id, :name)
  end

end