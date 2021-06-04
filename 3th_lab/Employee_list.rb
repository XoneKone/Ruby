require_relative 'Employee'
require_relative 'DBwork'
require 'yaml'
require 'json'
require 'rexml/document'
require 'builder'

# Class for storing a list of employees
class EmployeeList

  attr_accessor :employee_list

  def initialize
    self.employee_list = []
  end

  # reading data from a file.txt
  def read_list(path)
    data = IO.read(path).split("\n\n")
    data.each do |emp|
      fields = emp.split("\n")
      employee = Employee.new(*fields)
      add employee
    end
  end

  # reading data from a database
  def read_list_DB
    @employee_list = Database.instance.read_DB_emp_list
  end

  # adding an employee to the list
  def add(employee)
    employee_list.push(employee)
  end

  # adding an employee to the list and to the database
  def add_to_DB(data)
    add(Employee.new(get_last_id + 1, *data))
    Database.instance.add_node({ 'data' => data, 'table': 'Employees' })
  end

  # changing an employee in the list
  def change(employee, what_change, change)
    employee.send("#{what_change}=", change)
  end

  # changing an employee in the list and in the database
  def change_node(id, what_change, change)
    change(find(:id, id), what_change, change)
    h = { 'table' => 'Employees', 'what_change' => what_change, 'change' => change, 'field' => 'EmployeeID', 'id' => id }
    Database.instance.change_node(h)
  end

  # deleting an employee from the list
  def delete(employee)
    employee_list.delete(employee)
  end

  # deleting an employee from the list and from the database
  def delete_from_db(id)
    delete(find(:id, id))
    Database.instance.delete_node({ 'table' => 'Employees', 'field' => 'EmployeeID', 'id' => id })
  end

  # writing data to the data.txt
  def write_list
    str = ''
    File.open('data.txt', 'w') do |file|
      employee_list.each do |employee|
        str += employee.to_s
      end
      file.write str.chomp.chomp
    end
  end

  def write_list_YAML
    File.open('data.yaml', 'w') { |fl| fl.write YAML.dump(employee_list) }
  end

  def read_list_YAML
    file = YAML.load_file('data.yaml')
    @employee_list = file
  end

  def write_list_XML
    File.open('data.xml', 'w') do |fl|
      xml = Builder::XmlMarkup.new(:target => fl, :indent => 2)
      xml.instruct!
      xml.Employees {
        employee_list.each do |k|
          xml.employee {
            xml.id k.id
            xml.fullname k.fullname
            xml.birthdate k.birthdate
            xml.mobphone k.mobphone
            xml.address k.address
            xml.email k.email
            xml.passport k.passport
            xml.specialization k.specialization
            xml.workexp k.workexp
            xml.prevnamework k.prevnamework
            xml.post k.post
            xml.prevsalary k.prevsalary
          }
        end
      }
    end
  end

  def read_list_XML
    xmlfile = File.read('data.xml')
    xmldoc = REXML::Document.new(xmlfile)
    result = []
    data = []

    xmldoc.elements.each('Employees/employee/id') do |emp|
      data << emp.text.to_i
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/fullname') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/birthdate') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/mobphone') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/address') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/email') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/passport') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/specialization') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/workexp') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/prevnamework') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/post') do |emp|
      data << emp.text
    end
    result << data

    data = []
    xmldoc.elements.each('Employees/employee/prevsalary') do |emp|
      data << emp.text
    end
    result << data

    data = result[0].map { |el| [el] }
    (0..result[0].length - 1).each do |i|
      result.each do |element|
        data[i] << element[i]
      end
    end
    data.each do |el|
      add Employee.new(*el[1..-1])
    end
  end

  def write_list_JSON
    File.open('data.json', 'w') { |fl| fl.write JSON.dump(employee_list) }
  end

  def read_list_JSON
    file = JSON.load_file('data.json')
    @employee_list = file
  end

  # search by a giving key
  def find(key, string)
    employee_list.each do |dr|
      return dr if dr.send(key) == string
    end
    nil
  end

  # showing all employees
  def show
    data = ''
    employee_list.each do |emp|
      data += "Работник №#{emp.id}\n" \
              "ФИО: #{emp.fullname}\n" \
              "Дата рождения: #{emp.birthdate}\n" \
              "Номер телефона: #{emp.mobphone}\n" \
              "Адрес: #{emp.address}\n" \
              "E-mail: #{emp.email}\n" \
              "Паспорт: #{emp.passport}\n" \
              "Специальность: #{emp.specialization}\n" \
              "Стаж работы: #{emp.workexp}\n" \
              "Предыдущее место работы: #{emp.prevnamework}\n" \
              "Должность: #{emp.post}\n" \
              "Предыдущая зарплата: #{emp.prevsalary}\n\n"
    end
    data
  end

  # sort by a given key
  def sort(key)
    employee_list.sort_by! { |emp| emp.send(key) }
  end

  def length
    employee_list.length
  end

  def get_last_id
    employee_list[-1].id
  end

  def each(&block)
    @employee_list.each(&block)
  end

end