class TerminalViewListEmployee
    include Enumerable

    attr_accessor :name, :employees

    def initialize(name)
        @name =name
        @employees = []
    end
    
    def add_employees(*employees)
        employees.each do |e|
            puts "\nПроверьте корректность введенных данных:\n"
            puts e
            puts "\nДанные корректны? (да/нет)\n"
            answer = STDIN.gets.chomp
            case answer
                when "да"
                    @employees << e
                when "нет"
                    begin
                        puts "\nВведите данные заново."
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
                        @employees << TestEmployee.new(fullname,birthdate,mobphone,address,email,passport,specialization,workexp,prevnamework,post,prevsalary)
                    rescue ArgumentError => e
                       p e.message
                    end
                else
            end
        end
    end

    def to_s
        "#{@name} list: #{@employees.join(',')}"
    end

    def each
        @employees.each {|employee| yield employee}
    end

end