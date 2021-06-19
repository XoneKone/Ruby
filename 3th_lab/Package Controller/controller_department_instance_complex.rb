require_relative 'controller_instance_complex'
require_relative '../Package View/view_department'

class ControllerDepartmentInstanceComplex < ControllerInstanceComplex

  def self.factory_method(app, controller_list)
    new(ViewDepartment.new(app), Department.new, controller_list)
  end

  def fill_form(text_field)
    text_field.text = ''
  end

  def save(new_data)
    @instance.dep_name = new_data
    @instance.id = @controller_list.get_last_id
    @controller_list.add_instance(@instance)
  end

end