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
        @prevnamework= @workexp == 0 ? "" : prevnamework
    end

    def post
        @post
    end

    def post=(post)
        @post= @workexp == 0 ? "" : post
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
end


test = Employee.new("Хван","Константин","Леонидович","14.10.2000","8918213213","ул. Пушкина, д. Колотушкина","kostya@mail.ru","032341312","программист",0,"дфд","жфв","по")
p test
