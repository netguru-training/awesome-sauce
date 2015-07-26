class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :owner_or_admin?, only: [:edit, :update, :destroy]

  expose(:user)
  expose(:users)


  def index
  end

  def show
  end

  def edit
  end

  def update
    if user.update_attributes(secure_params)
      redirect_to users_path, notice: "User updated."
    else
      redirect_to users_path, alert: "Unable to update user."
    end
  end

  def destroy
    user.destroy
    redirect_to users_path, notice: "User deleted."
  end

  private

  def owner_or_admin?
    return if current_user.admin? || current_user.id == params[:id].to_i
    redirect_to :back, alert: "Access denied."
  end

  def secure_params
    params.require(:user).permit(:role, :avatar)
  end
end
