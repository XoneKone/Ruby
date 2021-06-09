require_relative 'controller_list'
require_relative '../Package View/view_department_list'
require_relative '../Package Model/department_list'

class ControllerDepartmentList < ControllerList

  def view_list=(view_list)
    @view_list = view_list
    @view_list.controller = self
  end

  def initialize(view_list, list)
    self.view_list = view_list
    self.list = list
  end

  def self.factory_method
    new(ViewDepartmentList.new(FXApp.new), DepartmentList.new)
  end

end

a = ControllerDepartmentList.factory_method
a.show_view
