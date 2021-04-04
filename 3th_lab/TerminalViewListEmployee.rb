require_relative "ListEmployee"


############################################################################################################
#                                                                                                          #
#                                     Class TerminalViewListEmployee                                       #
#                                                                                                          #
############################################################################################################

class TerminalViewListEmployee


    attr_accessor :list_employee

    def initialize()
        self.list_employee = ListEmployee.new('data.txt')
    end

    def show    
      self.list_employee.show
    end

    def add
        begin
            puts "Введите данные работника:"

            print "ФИО: "
            fullname = STDIN.gets.chomp

            print "Дата рождения: "
            birthdate = STDIN.gets.chomp

            print "Номер телефона: "
            mobphone = STDIN.gets.chomp

            print "Адрес: "
            address = STDIN.gets.chomp

            print "E-mail: "
            email = STDIN.gets.chomp

            print "Паспорт: "
            passport = STDIN.gets.chomp

            print "Специальность: "
            specialization = STDIN.gets.chomp

            print "Стаж: "
            workexp = STDIN.gets.chomp.to_i

            print "Название предыдущей работы: "
            prevnamework = STDIN.gets.chomp

            print "Должность: "
            post = STDIN.gets.chomp

            print "Предыдущая зарплата: "
            prevsalary = STDIN.gets.chomp.to_i

            emp = Employee.new(fullname,birthdate,mobphone,address,email,passport,specialization,workexp,prevnamework,post,prevsalary)
            list_employee.add emp
            rescue ArgumentError => e
                puts e.message
                puts "Введите данные заново!"
                add      
        end

    end

    def find
        print "Введите ФИО для поиска: "
        name = STDIN.gets.chomp
        puts self.list_employee.find name
    end

    def change
    end

    def delete
    end

    def save
        list_employee.write_list
    end
    
    def close
    end

    def sort (by)
    end

end

test = TerminalViewListEmployee.new()

test.show

test.save()

test.find