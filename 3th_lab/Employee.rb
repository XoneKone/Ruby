# frozen_string_literal: true

require 'date'
require_relative 'Validator'

#######################################################################################################
#                                                                                                     #
#                                   Class Employee                                                    #
#                                                                                                     #
#######################################################################################################

class Employee

  include Validator

  #######################################################################################################
  #                                                                                                     #
  #                                   Getters                                                           #
  #                                   Setters                                                           #
  #                                                                                                     #
  #######################################################################################################
  def id
    @id
  end

  def id=(id)
    @id = id
  end

  def fullname
    @fullname
  end

  def fullname=(fullname)
    @fullname = Validator.to_valid_fullname fullname
  end

  def birthdate
    @birthdate
  end

  def birthdate=(birthdate)
    @birthdate = Validator.to_valid_birthdate birthdate

  end

  def mobphone
    @mobphone
  end

  def mobphone=(mobphone)
    @mobphone = Validator.to_valid_mobphone mobphone
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
    @email = Validator.to_valid_email email
  end

  def passport
    @passport
  end

  def passport=(passport)
    @passport = Validator.to_valid_passport passport
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
    @workexp = workexp.to_i.negative? ? 0 : workexp.to_i
  end

  def prevnamework
    @prevnamework
  end

  def prevnamework=(prevnamework)
    @prevnamework = @workexp.zero? ? 'NA' : prevnamework
  end

  def post
    @post
  end

  def post=(post)
    @post = @workexp.zero? ? 'NA' : post
  end

  def prevsalary
    @prevsalary
  end

  def prevsalary=(prevsalary)
    @prevsalary = @workexp.to_i.zero? ? 0 : prevsalary.to_i
  end

  #######################################################################################################
  #                                                                                                     #
  #                                           Constructor                                               #
  #                                                                                                     #
  #######################################################################################################

  def initialize(id, fullname, birthdate, mobphone, address, email, passport, specialization, workexp = 0, prevnamework = '', post = nil, prevsalary = 0)
    self.id = id.to_i
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

  def get_list
    [id, fullname, birthdate, mobphone, address, email, passport, specialization, workexp, prevnamework, post, prevsalary]
  end

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




