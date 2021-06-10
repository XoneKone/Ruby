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
    @controller.display_info_for(item, app)
  end

  def change_info(item)
    # code here
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

            change = FXMenuCommand.new(menu_pane, 'Изменить')
            change.connect(SEL_COMMAND) { change_info(item) }

            delete_dep = FXMenuCommand.new(menu_pane, 'Удалить')
            delete_dep.connect(SEL_COMMAND) { delete_department(item) }

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

  def choose(number)
    @controller.choose_instance(number)
  end

  def add_department

  end

  def delete_department(number) end

end