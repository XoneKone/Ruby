# frozen_string_literal: true

# Base salary
class BaseSalary
  attr_accessor :fixed_salary

  def initialize(fixed_salary)
    @fixed_salary = fixed_salary
  end

  def get_salary
    fixed_salary
  end
end

class AdditionalSalary
  attr_accessor :additional, :base_salary

  def initialize(base_salary, additional)
    @base_salary = base_salary
    @additional = additional
  end

  def get_salary
    @base_salary.get_salary + @additional
  end
end

class Salary
  attr_accessor :base_salary

  def initialize(fixed_salary)
    @base_salary = BaseSalary.new(fixed_salary)
  end

  def get_simple
    @base_salary
  end

  def get_premium_and_award(premium, award)
    @base_salary = AdditionalSalary.new(@base_salary, premium)
    @base_salary = AdditionalSalary.new(@base_salary, award)
    @base_salary.get_salary
  end


end


s1 = BaseSalary.new(10)
s2 = AdditionalSalary.new(s1, 1)
s3 = AdditionalSalary.new(s2, 2)
s4 = AdditionalSalary.new(s3, 3)

puts s4.get_salary