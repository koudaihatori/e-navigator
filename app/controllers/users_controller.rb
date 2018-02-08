class UsersController < ApplicationController

  before_action :user_logged_in?

  def index
  end
  def edit
    @user = current_user
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :birthday, :sex, :school)
  end

  def user_logged_in?
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
