# frozen_string_literal: true


require_relative 'view_list'

class ViewDepartmentList < ViewList
  attr_accessor :dep, :app, :summary

  def initialize(app)
    super(app, 'Список отделов')
    @app = app
    @summary = FXTextField.new(self, 20, opts: TEXTFIELD_NORMAL | LAYOUT_SIDE_BOTTOM | LAYOUT_FILL_X)
    FXHorizontalSeparator.new(self, LAYOUT_FILL_X | SEPARATOR_GROOVE | LAYOUT_SIDE_BOTTOM)

    @dep = FXList.new(self, opts: LIST_EXTENDEDSELECT | LAYOUT_FILL)

  end

  def display_info_for(item)
    cont_dep_instance = ControllerDepartmentInstance.factory_method(item)
    cont_dep_instance.show_view
  end

  def show_view
    @controller.each_department do |d|
      @dep.appendItem(d.to_s)
    end

    @dep.connect(SEL_RIGHTBUTTONRELEASE) do |sender, sel, event|
      unless event.moved?
        item = sender.getItemAt(event.win_x, event.win_y)
        p item
        unless item.nil?
          FXMenuPane.new(self) do |menu_pane|
            info = FXMenuCommand.new(menu_pane, 'Подробнее об этом отделе')
            info.connect(SEL_COMMAND) { display_info_for(item) }

            menu_pane.create
            menu_pane.popup(nil, event.root_x, event.root_y)
            @app.runModalWhileShown(menu_pane)
          end
        end
      end
    end
    run
  end

  def run
    @app.create
    @app.run
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