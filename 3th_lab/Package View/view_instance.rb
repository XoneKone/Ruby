require 'fox16'
include Fox

class ViewInstance < FXMainWindow
  attr_accessor :controller, :button_save, :button_cancel, :app

  def initialize(app, title)
    super(app, title, width: 300, height: 200)
    @app = app
  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end

  def show_view; end

  def on_close(sender, sel, event)
    q = FXMessageBox.question(@app, MBOX_YES_NO, "Sure?", "You sure?")
    if q == MBOX_CLICKED_YES
      close_view
    end
  end

  def run
    self.create
  end

  def show_instance
    @controller.show_instance
  end

  def save
    @controller.save
  end

  def close_view
    @controller.close_view
  end
end