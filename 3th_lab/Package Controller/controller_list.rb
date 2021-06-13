require_relative 'subject'

class ControllerList < ConcreteSubject

  # there should be a composition here
  attr_accessor :list
  attr_reader :view_list

  def view_list=(view_list)
    @view_list = view_list
    @view_list.controller = self
  end

  private_class_method :new

  def initialize(view_list, list)
    self.view_list = view_list
    self.list = list
    self.observers = []
  end

  def show_view
    @view_list.show_view
  end

  def display_info_for(item, app); end

  def show_list
    @list.show_list
  end

  def choose_instance(number)
    @list.choose(number)
  end

  def add_instance(arg)
    @list.add(arg)
  end

  def change(dep, what_change, change)
    @list.change(dep, what_change, change)
  end

  def change_instance(number); end

  def delete_instance(instance)
    @list.delete(instance) unless instance.nil?
  end

  def get_last_id
    @list.get_last_id
  end

  def close_view
    @view_list.close
  end

  def each_list(&block)
    @list.each_list(&block)
  end

  def self.factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end