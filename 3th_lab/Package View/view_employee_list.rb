# frozen_string_literal: true

require_relative '../Package View/view_list'

# View
class ViewEmployeeList < ViewList
  def initialize(app)
    super(app, 'Список работников')
  end
end
