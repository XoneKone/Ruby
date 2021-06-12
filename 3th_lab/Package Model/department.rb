class Department
  attr_accessor :post_list, :dep_name, :id

  def post_list=(post_list)
    @post_list = post_list
    @post_list.department = self unless post_list.nil?
  end

  def initialize(dep_id = nil, dep_name = nil, post_list = nil)
    @id = dep_id
    @dep_name = dep_name
    self.post_list = post_list
  end

  def read_DB(dep_id)
    Database.instance.read_DB_dep(dep_id)
  end

  def save
    Database.instance.change_node({ 'table' => 'Departments', 'what_change' => 'DepartmentName', 'change' => dep_name,
                                    'field' => 'DepartmentID', 'id' => id })
  end

  def data
    [dep_name]
  end

  def to_s
    "№#{id} #{dep_name}"
  end
end
