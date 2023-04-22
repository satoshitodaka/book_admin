class ProfilesController < ApplicationController
  before_action :set_user

  def show
  end

  def edit
  end

  def update
    user.update(user_params)
  end

  private
  
  def user_params
    params.require(:user).permit(Lname, :email)
  end

  def set_user
    user = current_user
  end
end
