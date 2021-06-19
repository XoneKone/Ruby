class Subject

  # @abstract
  #
  # @param [Observer] observer
  def attach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  # @abstract
  #
  # @param [Observer] observer
  def detach(observer)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  #
  # @abstract
  def notify
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteSubject < Subject
  attr_accessor :observers

  # @!attribute observers
  # @return [Array<Observer>] attr_accessor :observers private :observers


  # @param  observer
  def attach(observer)
    @observers.push(observer)
  end

  # @param [Observer] observer
  def detach(observer)
    @observers.delete(observer)
  end

  # Запуск обновления в каждом подписчике.
  def notify
    @observers.each(&:update)
  end
end
