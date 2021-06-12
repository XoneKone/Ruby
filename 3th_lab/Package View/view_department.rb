require_relative 'view_instance'
require 'fox16'
include Fox

class ViewDepartment < ViewInstance
  def initialize(app)
    super(app, 'Департамент')

  end

  def show_view
    matrix = FXMatrix.new(self, 2, MATRIX_BY_COLUMNS | LAYOUT_FILL)
    FXLabel.new(matrix, 'Департамент:')
    text = FXTextField.new(matrix, 20)
    text.text = @controller.full_data[0]
    @button_cancel = FXButton.new(self, 'Отмена', opts: TEXTFIELD_NORMAL | LAYOUT_SIDE_BOTTOM | LAYOUT_FILL_X)
    @button_save = FXButton.new(self, 'Сохранить', opts: TEXTFIELD_NORMAL | LAYOUT_SIDE_BOTTOM | LAYOUT_FILL_X)

    @button_cancel.connect(SEL_COMMAND, method(:on_close))
    @button_save.connect(SEL_COMMAND) { on_save(text.text) }

    run
  end

  def on_save(new_data)
    @controller.save(new_data)
    @controller.notify
    @controller.close_view
  end

end