require "date"
require_relative "Validator"

    #######################################################################################################
    #                                                                                                     #
    #                                   Class Driver                                                    #
    #                                                                                                     #
    #######################################################################################################


class Driver

    include Validator

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
        @fullname = Validator.is_valid_fullname fullname
    end

    def birthdate
        @birthdate
    end

    def birthdate=(birthdate)
        @birthdate = Validator.is_valid_birthdate birthdate
        
    end


    def mobphone
        @mobphone
    end

    def mobphone=(mobphone)
        @mobphone = Validator.is_valid_mobphone mobphone  
    end


    def address
        @address
    end

    def address=(address)
        @address = address
    end


    def passport
        @passport
    end

    def passport=(passport)
        @passport = Validator.is_valid_passport passport       
    end

    def category
        @category
    end

    def category=(category)
        @category = category
    end

    def driverexp
        @driverexp
    end

    def driverexp=(driverexp)
        @driverexp = driverexp.to_i < 0 ? 0 : driverexp.to_i
    end

    def salary
        @salary
    end

    def salary=(salary)
        @salary = @driverexp > 3 ? salary * 1.2 : salary
    end

    
    #######################################################################################################
    #                                                                                                     #
    #                                           Constructor                                               #
    #                                                                                                     #
    #######################################################################################################

    def initialize(fullname,birthdate,mobphone,address,email,passport,category,driverexp=0,salary)
        self.fullname = fullname
        self.birthdate = birthdate
        self.mobphone = mobphone
        self.address = address
        self.passport = passport
        self.category = category
        self.driverexp = driverexp
        self.salary = salary
    end

    #######################################################################################################
    #                                                                                                     #
    #                                           Validation                                                #
    #                                                                                                     #
    #######################################################################################################

    

    #######################################################################################################
    #                                                                                                     #
    #                                         Override methods                                            #
    #                                                                                                     #
    #######################################################################################################
    
    def to_s
        "#{fullname}\n" +
        "#{birthdate}\n" +
        "#{mobphone}\n" +
        "#{address}\n" +
        "#{email}\n" + 
        "#{passport}\n" +
        "#{specialization}\n" +
        "#{workexp}\n" + 
        "#{prevnamework}\n" +
        "#{post}\n" +
        "#{prevsalary}\n\n" 
    end
end


