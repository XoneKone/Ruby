require "date"

class Employee
    def fullname
        @fullname
    end

    def fullname=(fullname)
        begin
            @fullname= self.class.is_valid_fullname fullname
        rescue  StandardError => e
            puts e.message
        end
    end

    def birthdate
        @birthdate
    end

    def birthdate=(birthdate)
        begin
            @birthdate= self.class.is_valid_birthdate birthdate
        rescue StandardError => e
            puts e.message
        end     
    end


    def mobphone
        @mobphone
    end

    def mobphone=(mobphone)
        begin
            @mobphone = self.class.is_valid_mobphone mobphone
        rescue StandardError => e
            puts e.message
        end
    end


    def address
        @address
    end

    def address=(address)
        @address=address
    end


    def email
        @email
    end

    def email=(email)
        begin
            @email= self.class.is_valid_email email
        rescue StandardError => e
            puts e.message
        end 
    end

    def passport
        @passport
    end

    def passport=(passport)
        begin
            @passport = self.class.is_valid_passport passport  
        rescue StandardError => e
            puts e.message
        end
       
    end

    def specialization
        @specialization
    end

    def specialization=(specialization)
        @specialization=specialization
    end

    def workexp
        @workexp
    end

    def workexp=(workexp)
        @workexp=workexp
    end

    def prevnamework
        @prevnamework
    end

    def prevnamework=(prevnamework)
        @prevnamework= @workexp == 0 ? "NA" : prevnamework
    end

    def post
        @post
    end

    def post=(post)
        @post= @workexp == 0 ? "NA" : post
    end

    def prevsalary
        @prevsalary 
    end

    def prevsalary=(prevsalary)
        @prevsalary= @workexp == 0 ? 0 : prevsalary
    end
    


    def initialize(fullname,birthdate,mobphone,address,email,passport,specialization,workexp=0,prevnamework="",post="",prevsalary=0)
        self.fullname = fullname
        self.birthdate = birthdate
        self.mobphone = mobphone
        @address = address
        self.email = email
        self.passport = passport
        @specialization = specialization
        @workexp = workexp
        self.prevnamework = prevnamework
        self.post = post
        self.prevsalary = prevsalary
    end

    def self.is_russian_mobphone? mobphone
        mobphone.start_with?("+7","8")
    end

    def self.is_valid_mobphone mobphone
        raise StandardError, "Неправильный номер" unless self.is_russian_mobphone? mobphone
       
        if mobphone.start_with?("+7")
            mobphone.insert(2,'-')
            mobphone.insert(6,'-')
        else
            mobphone.insert(1,'-')
            mobphone.insert(5,'-')
        end
        return mobphone
    end
    
    def self.is_email? email
        (/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ =~ email ) != nil 
    end

    def self.is_valid_email email
        raise StandardError, "Неправильный email" unless self.is_email? email
        return email.downcase
    end

    def self.is_fullname? fullname
        (/[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[А-Я][а-я]*(\s[а-яА-Я]*)?$/ =~ fullname.rstrip.lstrip) != nil && fullname[/[0-9a-zA-Z]/] == nil
    end

    def self.is_valid_fullname fullname
        raise StandardError, "Неправильное ФИО" unless self.is_fullname? fullname
        name = fullname.lstrip.rstrip[/[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[А-Я][а-я]*(\s[а-яА-Я]*)?$/].gsub(/\s[-]\s/,'-').split
        name.map! {|e| e[/[-]/]==nil ? e.capitalize: e.split('-').map!{|k| k.capitalize}.join('-') }
        if name.length == 4 
             name[-1].downcase! 
        end

        return name.join(" ")
    end

    def self.is_birthdate? birthdate
        (/^([0-2]\d|3[0-1]|\d)\.(0[1-9]|1[0-2])\.(\d{2}|\d{4})$/ =~ birthdate) != nil
    end

    def self.is_valid_birthdate birthdate
        raise StandardError, "Неправильный формат даты" unless self.is_birthdate? birthdate
        unless birthdate[/.\d{4}/] == nil
           return DateTime.strptime(birthdate,'%d.%m.%Y').strftime('%d.%m.%Y')
        end
        return DateTime.strptime(birthdate,'%d.%m.%y').strftime('%d.%m.%Y')
    end

    def self.is_passport? passport
        (/^([0-9]{10})$/ =~ passport) != nil
    end

    def self.is_valid_passport passport
        raise StandardError, "Неправильный номер паспорта" unless self.is_passport? passport
        return passport.insert(2,' ').insert(5,' ')
    end

    def to_s
        "ФИО: #{@fullname}\n" +
        "Дата рождения: #{@birthdate}\n" +
        "Номер телефона: #{@mobphone}\n" +
        "Адрес: #{@address}\n" +
        "E-mail: #{@email}\n" + 
        "Паспорт: #{@passport}\n" +
        "Специальность: #{@specialization}\n" +
        "Стаж работы: #{@workexp}\n" + 
        "Предыдущее место работы: #{@prevnamework}\n" +
        "Должность: #{@post}\n" +
        "Предыдущая зарплата: #{@prevsalary}\n\n" 
    end
end

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
                    rescue StandardError => e
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

def main
    test1 = TestEmployee.new("Хван Константин Леонидович","14.10.2000","8918213213","ул. Пушкина, д. Колотушкина","kostYa@mail.ru","0323413212","программист",0)

    test2 = TestEmployee.new("Салтыков - щЕдрин Иван-Руслан Ахмед заде","12.05.1999","8912143258","ул. Красная, д. Колотушкина","gena@yandex.ru","0213418212","программист",1,"МТС","Junior",30000)

    test3 = TestEmployee.new("Иванов Иван Иванович","13.02.1994","89321132213","ул. Пыльная, д. Невидный","ivan@mail.ru","0321251312","Инженер",5,"Газпром","Главный инженер",200000)

    puts ""
   
    listEmployees = TerminalViewListEmployee.new("Кандидаты")
    listEmployees.add_employees(test1,test2,test3)
    listEmployees.each do |e|
    puts e
    end
    puts listEmployees
end


main
#TestEmployee.test

