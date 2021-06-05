# frozen_string_literal: true

# Base salary
class Salary
  def get_salary
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Decorator < Salary
  attr_accessor :salary

  def initialize(salary)
    @salary = salary
  end

  def get_salary
    @salary.get_salary
  end
end

class FixedSalary < Salary
  attr_accessor :fixed_salary

  def initialize(fixed_salary)
    @fixed_salary = fixed_salary
  end

  def get_salary
    @fixed_salary
  end
end

class PremiumSalary < Decorator
  attr_accessor :premium

  def initialize(salary, premium)
    super(salary)
    @premium = premium
  end

  def get_salary
    @salary.get_salary + @premium
  end
end

class QuartAwardSalary < Decorator
  attr_accessor :percent

  def initialize(salary, percent)
    super(salary)
    @percent = percent
  end

  def get_salary
    if [3, 6, 9, 12].include? Time.now
      @salary.get_salary * (@percent + 100) / 100
    else
      @salary.get_salary
    end
  end
end

class BonusSalary <Decorator
  attr_accessor :percent

  def initialize(salary, percent)
    super(salary)
    @percent = percent
  end

  def get_salary
    @salary.get_salary * (@percent + 100) / 100
  end
end


