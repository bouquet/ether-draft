class GroupsController < ApplicationController
  load_and_authorize_resource

  def index
  end

  def new
  end

  def show
    @group.description = Redcarpet.new(@group.description, :smart, :filter_html).to_html.html_safe
    @posts = @group.posts.order("last_replied DESC").page(params[:page])
  end

  def edit
  end

  def create
    respond_to do |format|
      if @group.save
        format.html{redirect_to(@group)}
      else
        format.html{render :action => 'new'}
      end
    end
  end

  def update
    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html{redirect_to(@group)}
      else
        format.html{render :action => 'edit'}
      end
    end
  end

  def join
    @group = Group.find(params[:group_id])
    @group.users << current_user
    redirect_to @group, :notice => "You have joined this group."
  end

  def quit
    @group = Group.find(params[:group_id])
    @group.users.delete(current_user)
    redirect_to @group, :notice => "You have quit this group."
  end
end
