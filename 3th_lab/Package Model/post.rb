# frozen_string_literal: true
require_relative 'salary'
# class Post
class Post
  include Comparable
  attr_accessor :salary, :employee, :post_id, :post_name, :department, :fixed_premium_bool, :fixed_premium_size,
                :quarterly_award_bool, :quarterly_award_size, :possible_bonus_bool, :possible_bonus_percent

  def <=>(other)
    post_id <=> other.post_id
  end

  #another method
  def employee=(employee)
    @employee = employee
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
                 quarterly_award_bool, quarterly_award_size, possible_bonus_bool, possible_bonus_percent, department = nil, employee_id = nil)
    @post_id = post_id
    @post_name = post_name
    @salary = FixedSalary.new(fixed_salary)
    if !possible_bonus_bool.zero?
      @salary = BonusSalary.new(@salary, possible_bonus_percent)
    elsif !quarterly_award_bool.zero?
      @salary = QuartAwardSalary.new(@salary, quarterly_award_size)
    elsif !fixed_premium_bool.zero?
      @salary = PremiumSalary.new(@salary, fixed_premium_size)
    end
    @department = department
    self.employee = create_emp(employee_id)
  end

  def data
    dep_id = department.nil? ? 'NULL' : department.id
    emp_id = employee.nil? ? 'NULL' : employee.id
    [post_name, fixed_salary, fixed_premium_bool, fixed_premium_size,
     quarterly_award_bool, quarterly_award_size, possible_bonus_bool,
     possible_bonus_percent, dep_id, emp_id]
  end

end
