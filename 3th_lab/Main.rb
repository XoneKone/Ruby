require_relative 'Package Controller/controller_department_list'

dep_cont = ControllerDepartmentList.factory_method

# Точка входа в программу
dep_cont.show_view
