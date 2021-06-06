class ControllerList

  # there should be a composition here
  attr_accessor :view_list, :list, :instance

  def show_view
    @view_list.show
  end

  def show_list
    @list.show_list
  end

  def choose_instance(number)
    @instance = @list.choose(number)
  end

  def add_instance(args)
    args.each do
      @list.add
    end
  end

  def show_instance
    @instance
  end

  def delete_instance
    list.delete(@instance) unless @instance.nil?
  end

  def close_view
    @view_list.close
  end

  def factory_method
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end