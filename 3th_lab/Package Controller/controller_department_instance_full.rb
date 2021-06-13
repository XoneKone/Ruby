require_relative 'controller_instance_full'
require_relative '../Package View/view_department'

class ControllerDepartmentInstanceFull < ControllerInstanceFull

  def self.factory_method(app, department, controller_list)
    new(ViewDepartment.new(app), department, controller_list)
  end

  def fill_form(text_field)
    text_field.text = @instance.data[0]
  end

  def save(new_data)
    @controller_list.change(@instance, 'dep_name', new_data)
  end
end
