class UsersController < ApplicationController
  def show
    @user = User.where(:login_name => params[:login_name]).first
  end
end
