class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin, :except => [:mycomments, :myrents]
  def index
      @users = User.all
  end

  def show
      @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
