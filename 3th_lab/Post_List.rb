require_relative 'DBwork'

class PostList
  attr_accessor :department, :post_list
  attr_writer :strategy

  def department=(department_id)
    @department = if department_id.nil?
                    nil
                  else
                    Database.instance.read_DB_dep(department_id)
                  end
  end

  def initialize(strategy, department_id = nil)
    @strategy = strategy
    self.department = department_id
    @post_list = read_DB
  end

  def add(post: Post)
    post_list.append(post)
  end

  def choose(int)
    post_list[int - 1]
  end

  def read_DB
    @strategy.read_DB_post_list(department)
  end
end

class Strategy
  def read_DB_post_list(_arg)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class WithDepStrategy < Strategy
  def read_DB_post_list(dep)
    Database.instance.read_DB_post_list_with_dep(dep.dep_id)
  end
end

class WithOutDepStrategy < Strategy
  def read_DB_post_list(_dep)
    Database.instance.read_DB_post_list_without_deb
  end
end

