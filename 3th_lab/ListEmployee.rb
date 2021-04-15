require_relative 'Employee'

############################################################################################################
#                                                                                                          #
#                                       Class ListEmployee                                                 #
#                                                                                                          #
############################################################################################################

class ListEmployee

  attr_accessor :employee_list

  def initialize(path)
    self.employee_list = []
    read_list path
  end

  def read_list(path)
    data = IO.read(path).split("\n\n")
    data.each do |emp|
      fields = emp.split("\n")
      employee = Employee.new(*fields)
      add employee
    end

  end

  def add(employee)
    employee_list.push(employee)
  end

  def change(employee, what_change, change)
    employee.send("#{what_change}=", change)
  end

  def delete(employee)
    employee_list.delete(employee)
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
    ind = 1
    employee_list.each do |emp|
      data += "Работник №#{ind}\n" \
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
      ind += 1
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
