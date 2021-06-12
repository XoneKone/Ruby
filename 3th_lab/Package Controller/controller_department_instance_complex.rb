require_relative 'controller_instance_complex'

class ControllerDepartmentInstanceComplex < ControllerInstanceComplex

  def self.factory_method(app)
    new(ViewDepartment.new(app), Department.new)
  end

end