require_relative 'controller_list'
require_relative 'controller_post_list'

require_relative 'controller_department_instance_full'
require_relative 'controller_department_instance_complex'
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

  def on_delete_instance(item)
    dep = @list.choose(item)
    delete_instance(dep)
    @view_list.update
  end

  def on_change_instance(number, app)
    dep = @list.choose(number)
    controller_dep_instance = ControllerDepartmentInstanceFull.factory_method(app, dep, self)
    controller_dep_instance.attach(@view_list)
    controller_dep_instance.show_view
  end

  def on_add_instance(app)
    controller_dep_instance = ControllerDepartmentInstanceComplex.factory_method(app, self)
    controller_dep_instance.attach(@view_list)
    controller_dep_instance.show_view
  end

end