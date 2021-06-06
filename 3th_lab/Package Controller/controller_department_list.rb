require_relative 'controller_list'
require_relative '../Package View/terminal_view_department_list'
require_relative '../Package Model/department_list'

class ControllerDepartmentList < ControllerList

  def view_list=(view_list)
    @view_list = view_list
    @view_list.controller = self
  end

  def factory_method
    self.view_list = TerminalViewDepartmentList.new
    self.list = DepartmentList.new
  end

end

a = ControllerDepartmentList.new
a.factory_method
puts a