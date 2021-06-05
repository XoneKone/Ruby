# frozen_string_literal: true

require_relative '../Package Model/department_list'
require_relative '../Package View/terminal_view_list'

class TerminalViewDepartmentList < TerminalViewList
  attr_accessor :department_list

  def initialize
    @department_list = DepartmentList.new
  end

  def show

  end

  def show_list

  end

  def choose

  end

  def add_department

  end

  def delete_department

  end

end
