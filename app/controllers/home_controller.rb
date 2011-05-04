class HomeController < ApplicationController
  def index
    @groups = Group.all
  end

  def dashboard
    redirect_to root_url, :alert => "Please login to access dashboard!" unless current_user
  end
end
