require_relative 'DBwork'

class PostList
  attr_accessor :department, :post_list
  attr_writer :strategy

  def department=(department)
    @department = department
    @post_list.each do |post|
      post.department = department
    end
  end

  def initialize(strategy, department_id = nil)
    @strategy = strategy
    @department = department_id
    @post_list = read_DB(department_id)
  end

  def add(post)
    post_list.append(post)
    Database.instance.add_node({ 'data' => post.data, 'table': 'Posts' })
  end

  def change(post, what_change, change)
    post.send("#{what_change}=", change)
    Database.instance.change_node({ 'table' => 'Posts', 'what_change' => what_change, 'change' => change,
                                    'field' => 'PostID', 'id' => post.post_id })
  end

  def delete(post)
    @post_list.delete(post)
    Database.instance.delete_node({ 'table' => 'Posts', 'field' => 'PostID', 'id' => post.post_id })
  end

  def choose(int)
    post_list[int - 1]
  end

  def read_DB(department_id)
    @strategy.read_DB_post_list(department_id)
  end

  def find(key, string)
    post_list.each do |dr|
      return dr if dr.send(key) == string
    end
    nil
  end

  def each_list(&block)
    @post_list.each(&block)
  end

end

class Strategy
  def read_DB_post_list(_arg)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class WithDepStrategy < Strategy
  def read_DB_post_list(dep)
    Database.instance.read_DB_post_list(dep)
  end
end

#argument null
class WithOutDepStrategy < Strategy
  def read_DB_post_list(dep)
    Database.instance.read_DB_post_list(dep)
  end
end

