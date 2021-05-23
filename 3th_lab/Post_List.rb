class PostList
  attr_accessor :posts, :department, :post_list

  def initialize
    @post_list = @posts
    @department = nil
  end

  def add(post)
    post_list.append(post)
  end

  def choose(int)
    post_list[int - 1]
  end
end
