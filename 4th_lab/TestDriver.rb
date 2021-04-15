require_relative "Driver"
require_relative "Validator"

class TestDriver < Driver

    def self.test
        print "1. ФИО\n2. Телефон\n3. Дата рождения\n4. Паспорт\nВведите номер: "
        answer = STDIN.gets.chomp.to_i
        case answer
        when 1
            print "Введите ФИО тут: "
            begin
                fullname = STDIN.gets.chomp
                puts Validator.to_valid_fullname fullname
            rescue StandardError => e
                puts e.message
            end
        when 2
            print "Введите номер телефона тут: "
            begin
                mobphone = STDIN.gets.chomp
                puts Validator.to_valid_mobphone mobphone
            rescue StandardError => e
                puts e.message
            end
        when 3
            print "Введите дату рождения тут: "
            begin
                birthdate = STDIN.gets.chomp
                puts Validator.to_valid_birthdate birthdate
            rescue StandardError => e
                puts e.message
            end
        when 4
            print "Введите паспорт тут: "
            begin
                passport = STDIN.gets.chomp
                puts Validator.to_valid_passport
            rescue StandardError => e
                puts e.message
            end   
        else
            puts "Нет такого номера"
        end
    end

    def to_s
        "Это анкета  ТЕСТОГО водителя:\n" +
        super() 
    end


end

test1 = TestDriver.new("Хван Константин Леонидович","14.10.2000","8918213213","ул. Пушкина, д. Колотушкина",'0323413212',"B",30000,5)
puts test1
fields = {1 => :fullname,2 => :birthdate}
p fields[1]