# frozen_string_literal: true

# class Post
class Post
  attr_accessor :salary, :employee, :post_id, :post_name

  def initialize(fixed_salary, post_id, post_name, fixed_premium_bool, fixed_premium_size,
                 quarterly_award_bool, quarterly_award_size, possible_bonus_bool, possible_bonus_percent, employee = nil)
    @post_id = post_id
    @post_name = post_name
    @salary = Salary.new(fixed_salary, fixed_premium_bool, fixed_premium_size,
                         quarterly_award_bool, quarterly_award_size, possible_bonus_bool, possible_bonus_percent)
    @employee = employee
  end
end