# frozen_string_literal: true

require_relative '../Package Model/DBwork'
require 'yaml'

# Реализация паттерна "Фасад"
class Facade
  # @param [Serialize1] serialize1
  # @param [Serialize2] serialize2
  # @param [Serialize3] serialize3
  def initialize(serialize1 = nil, serialize2 = nil, serialize3 = nil)
    @serialize1 = serialize1 || Serialize1.new
    @serialize2 = serialize2 || Serialize2.new
    @serialize3 = serialize3 || Serialize3.new
  end

  # Сериализует объект и его содержимое в разные файлы
  # @param [DepartmentList] dep_obj
  def serialize(dep_obj)
    @serialize1.serialize(dep_obj)
    @serialize2.serialize(dep_obj)
    @serialize3.serialize(dep_obj)
  end

  # Десериализует объект и его содержимое
  # @return [DepartmentList]
  def deserialize
    @serialize1.deserialize
  end
end

# Класс-сериализатор
class Serialize1
  # Метод записывает содержимое в файл с индексом 'save1.yaml'
  # @param [DepartmentList] dep_obj
  def serialize(dep_obj)
    File.open('save1.yaml', 'w') { |fl| fl.write YAML.dump(dep_obj) }
  end

  # @return [DepartmentList]
  def deserialize
    YAML.load_file('save1.yaml')
  end
end

# Класс-сериализатор
class Serialize2
  # Метод записывает содержимое в файл с индексом 'save2.yaml'
  # @param [DepartmentList] dep_obj
  def serialize(dep_obj)
    File.open('save2.yaml', 'w') { |fl| fl.write YAML.dump(dep_obj) }
  end

  # @return [DepartmentList]
  def deserialize
    YAML.load_file('save2.yaml')
  end
end

# Класс-сериализатор
class Serialize3
  # Метод записывает содержимое в файл с индексом 'save1.yaml'
  # @param [DepartmentList] dep_obj
  def serialize(dep_obj)
    File.open('save3.yaml', 'w') { |fl| fl.write YAML.dump(dep_obj) }
  end

  # @return [DepartmentList]
  def deserialize
    YAML.load_file('save3.yaml')
  end
end

# Класс-оболочка для хранения объектов [Department]
class DepartmentList
  attr_accessor :department_list, :facade

  # @!attribute department_list
  # @return [Array<Department>], [Facade]
  def initialize
    @department_list = read_DB
    @facade = Facade.new
  end

  # Метод добавления отдела в список отделов, а также в базу данных
  # @param [Department] department
  # @return nothing
  def add(department)
    @department_list.append(department)
    Database.instance.add_node({ data: department.data, table: 'Departments' })
  end

  # Метод изменяет конкретное поле отдела в самом списке и в базе данных
  # @param [Department] department
  # @param [String] what_change
  # @param change
  def change(department, what_change, change)
    department.send("#{what_change}=", change)
    Database.instance.change_node({ 'table' => 'Departments', 'what_change' => 'DepartmentName', 'change' => change,
                                    'field' => 'DepartmentID', 'id' => department.id })
  end

  # Метод для удаление отдела из списка отделов и из базы данных
  # @param [Department] department
  def delete(department)
    @department_list.delete(department)
    Database.instance.delete_node({ 'table' => 'Departments', 'field' => 'DepartmentID', 'id' => department.id })
  end

  # Метод позволяет выбрать конкретный отдел по его номеру в списке
  # @param [Integer] int
  def choose(int)
    @department_list[int]
  end

  # Метод позволяет сериализовать объект в разные файлы
  def serialize
    @facade.serialize(self)
  end

  # Метод позволяет десериализовать объект из файла
  # @return DepartmentList
  def deserialize
    @facade.deserialize
  end

  # Метод позволяет пройтись по всем элементам из списка
  def each_list(&block)
    @department_list.each(&block)
  end

  # Метод возвращает следующий за последним айдишник
  # @return [Integer]
  def get_last_id
    @department_list[-1].id + 1
  end

  # Метод позволяет вытащить данные из базы данных для списка отделов
  # @return [Array<Department>]
  def read_DB
    Database.instance.read_DB_dep_list
  end

end

