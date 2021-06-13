# frozen_string_literal: true

require 'fox16'
include Fox

# View
class ViewList < FXMainWindow
  attr_accessor :controller, :app, :add_button, :entity_list, :dialog

  def initialize(app, title)
    super(app, title, width: 500, height: 500)
    @app = app
    @add_button = FXButton.new(self, "Добавить", opts: TEXTFIELD_NORMAL | LAYOUT_SIDE_BOTTOM | LAYOUT_FILL_X)
    FXHorizontalSeparator.new(self, LAYOUT_FILL_X | SEPARATOR_GROOVE | LAYOUT_SIDE_BOTTOM)
    @entity_list = FXList.new(self, opts: LIST_EXTENDEDSELECT | LAYOUT_FILL)
    self.connect(SEL_CLOSE, method(:on_close))
    @add_button.connect(SEL_COMMAND) { on_add_instance }
  end

  def display_info_for(item)
    @controller.display_info_for(item, app)
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def show_view
    fill_list

    @entity_list.connect(SEL_RIGHTBUTTONRELEASE) do |sender, sel, event|
      unless event.moved?
        item = sender.getItemAt(event.win_x, event.win_y)
        p item
        unless item.nil?
          FXMenuPane.new(self) do |menu_pane|
            info = FXMenuCommand.new(menu_pane, 'Подробнее')
            info.connect(SEL_COMMAND) { display_info_for(item) }

            change = FXMenuCommand.new(menu_pane, 'Изменить')
            change.connect(SEL_COMMAND) { on_change_instance(item) }

            delete = FXMenuCommand.new(menu_pane, 'Удалить')
            delete.connect(SEL_COMMAND) { on_delete_instance(item) }

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

  def on_close(sender, sel, event)
    q = FXMessageBox.question(@app, MBOX_YES_NO, "Sure?", "You sure?")
    if q == MBOX_CLICKED_YES
      close_view
    end
  end

  def on_add_instance
    @controller.on_add_instance(app)
  end

  def show_list
    @controller.show_list
  end

  def choose(item)
    @controller.choose_instance(item)
  end

  def on_change_instance(item)
    @controller.on_change_instance(item, app)
  end

  def on_delete_instance(item)
    @controller.on_delete_instance(item)
  end

  def save
    @controller.save
  end

  def fill_list
    @controller.each_list do |d|
      @entity_list.appendItem(d.to_s)
    end
  end

  def update
    @entity_list.clearItems
    fill_list
  end

  def close_view
    @controller.close_view
  end
end
