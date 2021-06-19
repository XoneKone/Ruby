require_relative 'controller_instance'

class ControllerInstanceFull < ControllerInstance
  def full_data
    @instance.data
  end
end
