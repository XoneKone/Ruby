require 'fox16'
include Fox

class ViewInstance < FXMainWindow
  attr_accessor :instance, :controller

  def initialize(app, title)
    super(app, title, width: 500, height: 500)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def self.show_view; end

  def show_instance
    @controller.show_instance
  end

  def close_view
    @controller.close_view
  end
end