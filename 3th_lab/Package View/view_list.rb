# frozen_string_literal: true

require 'fox16'
include Fox

class ViewList < FXMainWindow
  attr_accessor :controller, :app

  def initialize(app, title)
    super(app, title, width: 500, height: 500)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def self.show_view

  end

  def add
    @controller.add
  end

  def show_list
    @controller.show_list
  end

  def choose
    @controller.choose
  end

  def change
    @controller.change
  end

  def del
    @controller.del
  end

  def save
    @controller.save
  end

  def close_view
    @controller.close_view
  end
end

ViewList.show_view