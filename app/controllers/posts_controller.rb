class PostsController < ApplicationController
  before_filter :load_group_post, :only => [:new, :create]
  before_filter :store_post_id
  load_and_authorize_resource

  def new
  end

  def create
    @post.update_attributes(params[:post])

    respond_to do |format|
      if @post.save
        format.html{redirect_to(@post)}
      else
        format.html{render :action => 'new'} 
      end
    end
  end

  def show
    @reply = Reply.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html{redirect_to(@post)}
      else
        format.html{render :action => 'edit'}
      end
    end
  end

  private

  def store_post_id
    session[:post_id] = params[:id] if params[:id]
  end

  def load_group_post
    @post = Group.find(session[:group_id]).posts.build(:user_id => current_user.id)
  end
end
