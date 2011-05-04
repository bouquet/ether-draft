class RepliesController < ApplicationController
  before_filter :load_post_reply, :only => :create
  load_and_authorize_resource

  def create
    @post = @reply.post
    @reply.update_attributes(params[:reply])

    respond_to do |format|
      if @reply.save
        format.html{redirect_to(@post)}
      else
        format.html{render :controller => :post, :action => 'show'} 
      end
    end
  end

  def destroy
    @reply.destroy
    redirect_to post_path(session[:post_id])
  end

  private

  def load_post_reply
    @reply = Post.find(session[:post_id]).replies.build(:user_id => current_user.id)
  end
end
