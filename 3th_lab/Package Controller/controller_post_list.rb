require_relative '../Package View/view_post_list'

class ControllerPostList < ControllerList
  def self.factory_method(app, department)
    new(ViewPostList.new(app), department.post_list)
  end

  def display_info_for(item, app)
    emp = @list.choose_instance(item)
    cont_instance = ControllerEmployeeInstanceFull.new
    cont_instance.show_view
  end
end