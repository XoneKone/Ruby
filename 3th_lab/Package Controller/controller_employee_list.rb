class ControllerEmployeeList < ControllerList

  def self.factory_method(app)
    new(ViewEmployeeList.new(app), EmployeeList.new)
  end

end