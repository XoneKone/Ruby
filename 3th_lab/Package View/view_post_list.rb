require_relative 'view_list'

class ViewPostList < ViewList

  def initialize(app)
    super(app, 'Список должностей отдела')
  end

  def run
    self.create
  end
end