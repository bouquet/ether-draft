class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :store_group_id

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private

  def store_group_id
    session[:group_id] = params[:group_id] if params[:group_id]
  end
end
