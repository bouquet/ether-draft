module PostsHelper
  def group_id
    @post.group_id ? @post.group_id : @post.group_id = session[:group_id]
  end
end
