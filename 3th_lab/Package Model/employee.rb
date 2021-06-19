# frozen_string_literal: true

require 'date'
require_relative 'validator'

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
  attr_accessor :id, :address, :specialization, :post

  attr_reader :fullname, :birthdate, :mobphone, :email, :passport, :workexp, :prevnamework, :prevsalary

  def fullname=(fullname)
    @fullname = Validator.to_valid_fullname fullname
  end

  def birthdate=(birthdate)
    @birthdate = Validator.to_valid_birthdate birthdate

  end

  def mobphone=(mobphone)
    @mobphone = Validator.to_valid_mobphone mobphone
  end

  def email=(email)
    @email = Validator.to_valid_email email
  end

  def passport=(passport)
    @passport = Validator.to_valid_passport passport
  end

  def workexp=(workexp)
    @workexp = workexp.to_i.negative? ? 0 : workexp.to_i
  end

  def prevnamework=(prevnamework)
    @prevnamework = @workexp.zero? ? 'NA' : prevnamework
  end

  def prevsalary=(prevsalary)
    @prevsalary = @workexp.to_i.zero? ? 0 : prevsalary.to_i
  end

  #######################################################################################################
  #                                                                                                     #
  #                                           Constructor                                               #
  #                                                                                                     #
  #######################################################################################################

  def initialize(id, fullname, birthdate, mobphone, address, email, passport, specialization, workexp = 0, prevnamework = '', post_id = nil, prevsalary = 0)
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
    self.post = post_id
    self.prevsalary = prevsalary
  end

  def data
    post_name = post.nil? ? 'NULL' : post.post_name
    [fullname, birthdate, mobphone, address, email, passport, specialization, workexp, prevnamework, post_name, prevsalary]
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
      "#{post.post_name}\n" +
      "#{prevsalary}\n\n"
  end
end




