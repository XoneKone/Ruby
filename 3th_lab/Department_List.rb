require_relative 'DBwork'
require 'yaml'

class Facade
  def initialize(seralize1 = nil, seralize2 = nil, seralize3 = nil)
    @serialize1 = seralize1 || Serialize1.new
    @serialize2 = seralize2 || Serialize2.new
    @serialize3 = seralize3 || Serialize3.new
  end

  def serialize(dep_obj)
    @serialize1.serialize(dep_obj)
    @serialize2.serialize(dep_obj)
    @serialize3.serialize(dep_obj)
  end

  def deserialize
    @serialize1.deserialize
    @serialize2.deserialize
    @serialize3.deserialize
  end
end

class Serialize1
  def serialize(dep_obj)
    File.open('save1.yaml', 'w') { |fl| fl.write YAML.dump(dep_obj) }
  end

  def deserialize
    YAML.load_file('save1.yaml')
  end
end

class Serialize2
  def serialize(dep_obj)
    File.open('save2.yaml', 'w') { |fl| fl.write YAML.dump(dep_obj) }
  end

  def deserialize
    YAML.load_file('save2.yaml')
  end
end

class Serialize3
  def serialize(dep_obj)
    File.open('save3.yaml', 'w') { |fl| fl.write YAML.dump(dep_obj) }
  end

  def deserialize
    YAML.load_file('save3.yaml')
  end
end

class DepartmentList
  attr_accessor :department_list, :facade

  def initialize
    @department_list = read_DB
    @facade = Facade.new
  end

  def add(department)
    @department_list.append(department)
    Database.instance.add_node({ 'data' => department.data, 'table': 'Departments' })
  end

  def change(department, what_change, change)
    department.send("#{what_change}=", change)
    Database.instance.change_node({ 'table' => 'Departments', 'what_change' => what_change, 'change' => change,
                                    'field' => 'DepartmentID', 'id' => department.id })
  end

  def delete(post)
    @department_list.delete(post)
    Database.instance.delete_node({ 'table' => 'Departments', 'field' => 'DepartmentID', 'id' => department.id })
  end

  def choose(int)
    @department_list[int - 1]
  end

  def serialize
    @facade.serialize(self)
  end

  def deserialize
    @facade.deserialize
  end

  def read_DB
    Database.instance.read_DB_dep_list
  end

end

