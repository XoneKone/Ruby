require_relative 'Employee'

############################################################################################################
#                                                                                                          #
#                                       Class ListEmployee                                                 #
#                                                                                                          #
############################################################################################################

class ListEmployee
    include Enumerable

    attr_accessor :employee_list

    def initialize(path)
        self.employee_list = []
    end

    def self.read_list path
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

    def self.add fields
        self.employee_list << Employee.new(*fields)
    end

    def self.change employee
        
    end

    def self.delete employee
    end

    def self.write_list
    end

    def self.find string
    end

    def self.show
        self.employee_list.join("\n")
    end

    def self.sort
    end


    def each
        @employee_list.each {|employee_list| yield employee_list}
    end

end

lst = ListEmployee.new('data.txt')
puts lst.show
