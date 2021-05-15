require_relative 'Employee'
require_relative 'testDB'
############################################################################################################
#                                                                                                          #
#                                       Class ListEmployee                                                 #
#                                                                                                          #
############################################################################################################

class ListEmployee

  attr_accessor :employee_list

  def initialize
    self.employee_list = read_list_DB
  end

  def read_list(path)
    data = IO.read(path).split("\n\n")
    data.each do |emp|
      fields = emp.split("\n")
      employee = Employee.new(*fields)
      add employee
    end
  end

  def read_list_DB()
    Database.instance.select_all
  end

  def add(employee)
    employee_list.push(employee)
  end

  def add_to_DB(data)
    add(Employee.new(*data))
    Database.instance.add_node(data)
  end

  def change(employee, what_change, change)
    employee.send("#{what_change}=", change)
  end

  def change_node(id, what_change, change)
    change(find(:EmployeeID, id), what_change, change)
    Database.instance.change_node(id, what_change, change)
  end

  def delete(employee)
    employee_list.delete(employee)
  end

  def delete_from_db(id)
    delete(find(:EmployeeID, id))
    Database.instance.delete_node(id)
  end

  def write_list
    str = ''
    File.open('data.txt', 'w') do |file|
      employee_list.each do |employee|
        str += employee.to_s
      end
      file.write str.chomp.chomp
    end
  end

  def find(key, string)
    employee_list.each do |dr|
      return dr if dr.send(key) == string
    end
    nil
  end

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

  def sort(key)
    employee_list.sort_by! { |emp| emp.send(key) }
  end

  def length
    employee_list.length
  end

  def get_emp(number)
    employee_list[number - 1]
  end

  def each(&block)
    @employee_list.each(&block)
  end

end


