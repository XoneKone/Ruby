require_relative 'Employee'

class TestEmployee < Employee

    def self.test
        print "1. ФИО\n2. Телефон\n3. Дата рождения\n 4. E-mail\n5. Паспорт\nВведите номер: "
        answer = STDIN.gets.chomp.to_i
        case answer
        when 1
            print "Введите ФИО тут: "
            begin
                fullname = STDIN.gets.chomp
                puts self.is_valid_fullname fullname
            rescue StandardError => e
                puts e.message
            end
        when 2
            print "Введите номер телефона тут: "
            begin
                mobphone = STDIN.gets.chomp
                puts self.is_valid_mobphone mobphone
            rescue StandardError => e
                puts e.message
            end
        when 3
            print "Введите дату рождения тут: "
            begin
                birthdate = STDIN.gets.chomp
                puts self.is_valid_birthdate birthdate
            rescue StandardError => e
                puts e.message
            end
        when 4
            print "Введите e-mail тут: "
            begin
                email = STDIN.gets.chomp
                puts self.is_valid_email email
            rescue StandardError => e
                puts e.message
            end
        when 5
            print "Введите паспорт тут: "
            begin
                passport = STDIN.gets.chomp
                puts self.is_valid_passport
            rescue StandardError => e
                puts e.message
            end   
        else
            puts "Нет такого номера"
        end
    end

    def to_s
        "Это анкета  ТЕСТОГО работника:\n" +
        super() 
    end

end

test1 = TestEmployee.new("Хван Константин Леонидович","14.10.2000","8918213213","ул. Пушкина, д. Колотушкина","kostYa@mail.ru","0323413212","программист",0)
print test1