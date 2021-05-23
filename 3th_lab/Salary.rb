# frozen_string_literal: true

# Base salary
class Base
  def get_salary
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class BaseSalary < Base
  attr_accessor :fixed_salary

  def initialize(fixed_salary)
    @fixed_salary = fixed_salary
  end

  def get_salary
    @fixed_salary
  end
end

class PremiumSalary < BaseSalary
  attr_accessor :premium, :base_salary

  def initialize(base_salary, premium)
    @base_salary = base_salary
    @premium = premium
  end

  def get_salary
    @base_salary.get_salary + @premium
  end
end

class PercentSalary < BaseSalary
  attr_accessor :percent, :base_salary

  def initialize(base_salary, percent)
    @base_salary = base_salary
    @percent = percent
  end

  def get_salary
    @base_salary.get_salary * (@percent + 100) / 100
  end
end

class Salary
  attr_accessor :base_salary, :fixed_premium_bool, :fixed_premium_size,
                :quarterly_award_bool, :quarterly_award_size, :possible_bonus_bool, :possible_bonus_percent

  def initialize(fixed_salary, fixed_premium_bool, fixed_premium_size,
                 quarterly_award_bool, quarterly_award_size, possible_bonus_bool, possible_bonus_percent)
    @base_salary = BaseSalary.new(fixed_salary)
    @fixed_premium_bool = fixed_premium_bool
    @fixed_premium_size = fixed_premium_size
    @quarterly_award_bool = quarterly_award_bool
    @quarterly_award_size = quarterly_award_size
    @possible_bonus_bool = possible_bonus_bool
    @possible_bonus_percent = possible_bonus_percent
  end

  def get_salary
    @base_salary.get_salary
  end

  def get_simple
    @base_salary = BaseSalary.new(0)
    @base_salary.get_salary
  end

  def get_premium_and_award
    @base_salary = PremiumSalary.new(@base_salary, @fixed_premium_size) unless @fixed_premium_bool.nil?
    @base_salary = PercentSalary.new(@base_salary, @quarterly_award_size) unless @quarterly_award_bool.nil?
    @base_salary.get_salary

  end

end


