require_relative 'controller_list'
require_relative 'controller_post_list'

require_relative 'controller_department_instance_full'
require_relative '../Package Model/department_list'
require_relative '../Package View/view_department_list'

class ControllerDepartmentList < ControllerList

  def self.factory_method
    new(ViewDepartmentList.new(FXApp.new), DepartmentList.new)
  end

  def display_info_for(item, app)
    dep = @list.choose(item)
    controller_post_list = ControllerPostList.factory_method(app, dep)
    controller_post_list.show_view
  end

  def change_instance(number, app)
    dep = @list.choose(number)
    controller_dep_instance = ControllerDepartmentInstanceFull.factory_method(app, dep)
    controller_dep_instance.attach(@view_list)
    controller_dep_instance.show_view
  end

  def add_instance(args)
    controller_dep_instance = ControllerDepartmentInstanceFull
  end

end