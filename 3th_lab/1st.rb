class Employee
    def name
        @name
    end

    def name=(name)
        @name=name
    end

    def surname
        @surname
    end

    def surname=(surname)
        @surname=surname
    end


    def midname
        @midname
    end

    def midname=(midname)
        @midname=midname
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
        @mobphone=mobphone
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
        @email=email
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
    


    def initialize(name,surname,midname,birthdate,mobphone,address,email,passport,specialization,workexp=0,prevnamework="",post="",prevsalary=0)
        @name = name
        @surname = surname
        @midname = midname
        @birthdate = birthdate
        @mobphone = mobphone
        @address = address
        @email = email
        @passport = passport
        @specialization = specialization
        @workexp = workexp
        self.prevnamework = prevnamework
        self.post = post
        self.prevsalary = prevsalary
    end

    def to_s
        "Это анкета работника:\n" + 
        "Фамилия: #{@name}\n" +
        "Имя: #{@surname}\n" +
        "Отчество: #{@midname}\n" +
        "Дата рождения: #{@birthdate}\n" +
        "Номер телефона: #{@mobphone}\n" +
        "Адрес: #{@address}\n" +
        "E-mail: #{@email}\n" + 
        "Паспорт: #{@passport}\n" +
        "Специальность: #{@specialization}\n" +
        "Стаж работы: #{@workexp}\n" + 
        "Предыдущее место работы: #{@prevnamework}\n" +
        "Должность: #{@post}\n" +
        "Предыдущая зарплата: #{@prevsalary}\n" 
    end
end

class TestEmployee < Employee

    def to_s
        "Это анкета  ТЕСТОГО работника:\n" + 
        "Фамилия: #{@name}\n" +
        "Имя: #{@surname}\n" +
        "Отчество: #{@midname}\n" +
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


test = TestEmployee.new("Хван","Константин","Леонидович","14.10.2000","8918213213","ул. Пушкина, д. Колотушкина","kostya@mail.ru","032341312","программист",0)
test1 = TestEmployee.new("Горин","Геннадий","Геннадьевич","12.05.1999","8912143258","ул. Красная, д. Колотушкина","gena@yandex.ru","021341812","программист",1,"МТС","Junior",30000)
test2 = TestEmployee.new("Иванов","Иван","Иванович","13.02.1994","89321132213","ул. Пыльная, д. невидный","ivan@mail.ru","032125312","Инженер",5,"Газпром","Главный инженер",200000)

puts test
puts test1
puts test2
 
