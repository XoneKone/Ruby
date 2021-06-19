# frozen_string_literal: true

require_relative 'view_list'

class ViewDepartmentList < ViewList

  def initialize(app)
    super(app, 'Список отделов')
  end

  def show_list; end

  def choose(number)
    @controller.choose_instance(number)
  end

  def add_department; end

  def delete_department(number) end

end
