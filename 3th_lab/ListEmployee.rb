require_relative 'Employee'
####################################
=begin
        Класс ListEmployee
=end
####################################

class ListEmployee

    attr_accessor :employee_list

    def initialize(path)
        self.employee_list = Array.new()
        read_list path
    end

    def read_list path
        data = IO.read(path).split("\n\n")
        data.each do |emp|
        fields = emp.split("\n")
        employee = Employee.new(*fields)
        self.add employee       
        end
        
    end

    def add employee
        self.employee_list.push(employee) 
    end

    def change employee
    end

    def delete employee
    end

    def write_list
        str = ''
        File.open('storage.txt','w') {|file|
            @employee_list.each do |employee|
                str += employee.to_s
            end
            file.write str[0..-3]
        }
    end

    def find string
        employee_list.each do |emp|
            if emp.fullname == string
                return emp  
            end
        end
        return "Такого работника нет!"
    end

    def show
        employee_list.each do |emp|
        puts "ФИО: #{emp.fullname}\n" +
            "Дата рождения: #{emp.birthdate}\n" +
            "Номер телефона: #{emp.mobphone}\n" +
            "Адрес: #{emp.address}\n" +
            "E-mail: #{emp.email}\n" + 
            "Паспорт: #{emp.passport}\n" +
            "Специальность: #{emp.specialization}\n" +
            "Стаж работы: #{emp.workexp}\n" + 
            "Предыдущее место работы: #{emp.prevnamework}\n" +
            "Должность: #{emp.post}\n" +
            "Предыдущая зарплата: #{emp.prevsalary}\n\n" 
    end
    end

    def sort
    end
end

lst = ListEmployee.new('data.txt')

