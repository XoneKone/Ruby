class Department
  attr_accessor :post_list, :dep_name, :dep_id

  def initialize(dep_id = nil, dep_name = nil, post_list = nil)
    @dep_id = dep_id
    @dep_name = dep_name
    @post_list = post_list
  end
end
