require_relative 'subject'

class ControllerInstance < ConcreteSubject
  attr_accessor :instance, :controller_list
  attr_reader :view_instance

  def view_instance=(view_instance)
    @view_instance = view_instance
    @view_instance.controller = self
  end

  private_class_method :new

  def initialize(view_instance, instance, controller_list)
    self.view_instance = view_instance
    self.instance = instance
    self.controller_list = controller_list
    self.observers = []
  end

  def show_view
    @view_instance.show_view
  end

  def close_view
    @view_instance.close
  end

  def self.factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end