class Employee
    def fullname
        @fullname
    end

    def fullname=(fullname)
        @fullname=fullname
    end

    def birthdate
        @birthdate
    end

    def birtdate=(birthdate)
        @birthdate=birthdate
    end


    def mobphone
        @mobphone
    end

    def mobphone=(mobphone)
        @mobphone = self.class.is_valid_mobphone mobphone
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
        @email= self.class.is_valid_email email
    end

    def passport
        @passport
    end

    def passport=(passport)
        @passport = passport
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
        @fullname = fullname
        @birthdate = birthdate
        self.mobphone = mobphone
        @address = address
        self.email = email
        @passport = passport
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
        raise StandardError, "Это не российский номер" unless self.is_russian_mobphone? mobphone
       
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

    def to_s
        "Это анкета  ТЕСТОГО работника:\n" +
        super() 

    end
end


#test = TestEmployee.new("Хван Константин Леонидович","14.10.2000","8918213213","ул. Пушкина, д. Колотушкина","kostYa@mail.ru","032341312","программист",0)
#puts test
#test1 = TestEmployee.new("Горин Геннадий Геннадьевич","12.05.1999","8912143258","ул. Красная, д. Колотушкина","gena@yandex.ru","021341812","программист",1,"МТС","Junior",30000)
#puts test1
#test2 = TestEmployee.new("Иванов Иван Иванович","13.02.1994","89321132213","ул. Пыльная, д. невидный","ivan@mail.ru","032125312","Инженер",5,"Газпром","Главный инженер",200000)
#puts test2

fullname = "Горин Геннадий Геннадьевич заде"

p TestEmployee.is_valid_fullname "Салтыков - щЕдрин Иван-Руслан Ахмед заде"
