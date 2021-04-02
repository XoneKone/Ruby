require_relative 'Employee'
####################################
=begin
        Класс ListEmployee
=end
####################################

class ListEmployee
    attr_accessor :employee_list

    def initialize(path)
        self.employee_list = []
        self.read_list path
    end

    def read_list path
        begin
        data = IO.read(path).split("|\n")
       
        rescue Errno::ENOENT => error
            puts error.message
        else
            data.each do |emp|
            fields = emp.split("\n")
            self.class.add fields
        end
        end
        
    end

    def add fields
        self.employee_list << Employee.new(*fields)
    end

    def change employee
    end

    def delete employee
    end

    def write_list
    end

    def find string
    end

    def show
        self.employee_list.join("\n")
    end

    def sort
    end
end

lst = ListEmployee.new('data.txt')
puts lst.show
