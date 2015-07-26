class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :owner_or_admin?, :only => [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

    def owner_or_admin?
      return if current_user.admin? || current_user.id == params[:id].to_i
      redirect_to :back, :alert => "Access denied."
    end

    def secure_params
      params.require(:user).permit(:role, :avatar)
    end
end
