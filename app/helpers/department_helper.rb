module DepartmentHelper

  def department_order
    Department.all.order(:name)
  end

end