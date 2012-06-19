class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :except => [:mycomments, :myrents]
  def index
      @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

end
