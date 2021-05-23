class DepartmentList
  attr_accessor :departments, :department_list

  def initialize
    @department_list = departments

  end

  def add(department)
    @department_list.append(department)
  end

  def choose(int)
    @department_list[int - 1]
  end

end
