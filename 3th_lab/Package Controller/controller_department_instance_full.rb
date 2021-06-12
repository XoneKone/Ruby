require_relative 'controller_instance_full'
require_relative '../Package View/view_department'

class ControllerDepartmentInstanceFull < ControllerInstanceFull

  def self.factory_method(app, department)
    new(ViewDepartment.new(app), department)
  end

  def save(new_data)
    @instance.dep_name = new_data
    @instance.save
  end
end
