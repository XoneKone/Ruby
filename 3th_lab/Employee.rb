require "date"

    #######################################################################################################
    #                                                                                                     #
    #                                   Class Employee                                                    #
    #                                                                                                     #
    #######################################################################################################


class Employee

    #######################################################################################################
    #                                                                                                     #
    #                                   Getters                                                           #
    #                                   Setters                                                           #
    #                                                                                                     #
    #######################################################################################################
    def fullname
        @fullname
    end

    def fullname=(fullname)
        begin
            @fullname = self.class.is_valid_fullname fullname
        rescue ArgumentError=> e
            puts e.message
            until self.class.is_fullname? fullname
                print "Введите корректное ФИО: "
                fullname = gets.chomp
            end
            @fullname = self.class.is_valid_fullname fullname
        end
        
    end

    def birthdate
        @birthdate
    end

    def birthdate=(birthdate)
        begin
            @birthdate = self.class.is_valid_birthdate birthdate
        rescue ArgumentError => e
            puts e.message
            until self.class.birthdate? birthdate
                print "Введите корректную дату рождения: "
                birthdate = gets.chomp
            end
            @birthdate = self.class.is_valid_birthdate birthdate
        end
        
    end


    def mobphone
        @mobphone
    end

    def mobphone=(mobphone)
        begin
            @mobphone = self.class.is_valid_mobphone mobphone
        rescue ArgumentError => e
            puts e.message
            until self.class.is_russian_mobphone? mobphone
                print "Введите корректный номер телефона: "
                mobphone = gets.chomp
            end
            @mobphone = self.class.is_valid_mobphone mobphone
        end
        
    end


    def address
        @address
    end

    def address=(address)
        @address = address
    end


    def email
        @email
    end

    def email=(email)
        begin
            @email = self.class.is_valid_email email    
        rescue ArgumentError => e
            puts e.message
            until self.class.is_email? email
                print "Введите корректный email: "
                email = gets.chomp
            end
            @email = self.class.is_valid_email email
        end      
    end

    def passport
        @passport
    end

    def passport=(passport)
        begin
            @passport = self.class.is_valid_passport passport    
        rescue ArgumentError => e
            puts e.message
            until self.class.is_passport? passport
                print "Введите корректный email: "
                passport = gets.chomp
            end
            @passport = self.class.is_valid_passport passport
        end     
    end

    def specialization
        @specialization
    end

    def specialization=(specialization)
        @specialization = specialization
    end

    def workexp
        @workexp
    end

    def workexp=(workexp)
        @workexp = workexp.to_i < 0 ? 0 : workexp.to_i
    end

    def prevnamework
        @prevnamework
    end

    def prevnamework=(prevnamework)
        @prevnamework = @workexp == 0 ? "NA" : prevnamework
    end

    def post
        @post
    end

    def post=(post)
        @post = @workexp == 0 ? "NA" : post
    end

    def prevsalary
        @prevsalary 
    end

    def prevsalary=(prevsalary)
        @prevsalary = @workexp.to_i == 0 ? 0 : prevsalary.to_i
    end
    
    #######################################################################################################
    #                                                                                                     #
    #                                           Constructor                                               #
    #                                                                                                     #
    #######################################################################################################

    def initialize(fullname,birthdate,mobphone,address,email,passport,specialization,workexp=0,prevnamework="",post="",prevsalary=0)
        self.fullname = fullname
        self.birthdate = birthdate
        self.mobphone = mobphone
        self.address = address
        self.email = email
        self.passport = passport
        self.specialization = specialization
        self.workexp = workexp
        self.prevnamework = prevnamework
        self.post = post
        self.prevsalary = prevsalary
    end

    #######################################################################################################
    #                                                                                                     #
    #                                           Validation                                                #
    #                                                                                                     #
    #######################################################################################################

    def self.is_russian_mobphone? mobphone
        (/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/ =~ mobphone) != nil 
    end

    def self.is_valid_mobphone mobphone
        raise ArgumentError, "Неправильный номер" unless self.is_russian_mobphone? mobphone
        return mobphone.gsub('-','').gsub('(','').gsub(')','').gsub(' ','').gsub('+','').insert(1,'-').insert(5,'-')
    end
    
    def self.is_email? email
        (/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/ =~ email ) != nil 
    end

    def self.is_valid_email email
        raise ArgumentError, "Неправильный email" unless self.is_email? email
        return email.downcase
    end

    def self.is_fullname? fullname
        (/[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[а-яА-я]*(\s?[-]\s?[а-яА-Я]*)?\s[А-Я][а-я]*(\s[а-яА-Я]*)?$/ =~ fullname.rstrip.lstrip) != nil && fullname[/[0-9a-zA-Z]/] == nil
    end

    def self.is_valid_fullname fullname
        raise ArgumentError, "Неправильное ФИО" unless self.is_fullname? fullname
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
        raise ArgumentError, "Неправильный формат даты" unless self.is_birthdate? birthdate
        unless birthdate[/.\d{4}/] == nil
            return DateTime.strptime(birthdate,'%d.%m.%Y').strftime('%d.%m.%Y')
        end
        return DateTime.strptime(birthdate,'%d.%m.%y').strftime('%d.%m.%Y')
    end

    def self.is_passport? passport
        (/^([0-9]{10})$/ =~ passport) != nil
    end

    def self.is_valid_passport passport
        raise ArgumentError, "Неправильный номер паспорта" unless self.is_passport? passport
        return passport.insert(2,' ').insert(5,' ')
    end

    #######################################################################################################
    #                                                                                                     #
    #                                         Override methods                                            #
    #                                                                                                     #
    #######################################################################################################
    
    def to_s
        "ФИО: #{fullname}\t" +
        "Дата рождения: #{birthdate}\t" +
        "Номер телефона: #{mobphone}\t" +
        "Адрес: #{address}\t" +
        "E-mail: #{email}\t" + 
        "Паспорт: #{passport}\t" +
        "Специальность: #{specialization}\t" +
        "Стаж работы: #{workexp}\t" + 
        "Предыдущее место работы: #{prevnamework}\t" +
        "Должность: #{post}\t" +
        "Предыдущая зарплата: #{prevsalary}\t\n" 
    end
end


