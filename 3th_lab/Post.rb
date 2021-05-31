# frozen_string_literal: true
require_relative 'Salary'
# class Post
class Post
  attr_accessor :salary, :employee, :post_id, :post_name

  #another method
  def employee=(employee)
    @employee.post = self unless employee.nil?
  end

  def create_emp(employee_id)
    @employee = if employee_id.nil?
                  nil
                else
                  Database.instance.read_DB_emp(employee_id)
                end
  end

  def initialize(post_id, post_name, fixed_salary, fixed_premium_bool, fixed_premium_size,
                 quarterly_award_bool, quarterly_award_size, possible_bonus_bool, possible_bonus_percent, dep_id = nil, employee_id = nil)
    @post_id = post_id
    @post_name = post_name
    @salary = if !fixed_premium_bool.zero? && !quarterly_award_bool.zero? && !possible_bonus_bool.zero?
                PremiumSalary.new(
                  QuartAwardSalary.new(BonusSalary.new(FixedSalary.new(fixed_salary), possible_bonus_percent),
                                       quarterly_award_size), fixed_premium_size
                )
              elsif !fixed_premium_bool.zero? && !quarterly_award_bool.zero?
                PremiumSalary.new(QuartAwardSalary.new(FixedSalary.new(fixed_salary), quarterly_award_size),
                                  fixed_premium_size)
              else
                FixedSalary.new(fixed_salary)
              end
    self.employee = create_emp(employee_id)
  end
end