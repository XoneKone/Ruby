require_relative 'DBwork'

class DepartmentList
  attr_accessor :department_list

  def initialize
    @department_list = read_DB
  end

  def add(department)
    @department_list.append(department)
  end

  def choose(int)
    @department_list[int - 1]
  end

  def read_DB
    Database.instance.read_DB_dep_list
  end

end



