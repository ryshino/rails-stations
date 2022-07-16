class Admin::UsersController < ApplicationController
  before_action :authenticate_admin_user!
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])

    @user.destroy
    flash[:notice] = 'ユーザーを削除しました'
    redirect_to admin_users_path  
  end

end
