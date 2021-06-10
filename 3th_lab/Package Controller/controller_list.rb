class ControllerList

  # there should be a composition here
  attr_accessor :view_list, :list

  private_class_method :new

  def show_view
    @view_list.show_view
  end

  def show_list
    @list.show_list
  end

  def choose_instance(number)
    @list.choose(number)
  end

  def add_instance(args)
    args.each do
      @list.add
    end
  end

  def delete_instance
    @list.delete(@instance) unless @instance.nil?
  end

  def close_view
    @view_list.close
  end

  def each_department(&block)
    @list.each_department(&block)
  end

  def self.factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end