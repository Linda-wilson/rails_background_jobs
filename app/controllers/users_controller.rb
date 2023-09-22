class UsersController < ApplicationController

  def update
    if current_user.update(user_params)
      FakeJob.perform_later(current_user)  # <- The job is queued
      flash[:notice] = "Your profile has been updated"
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :admin)
  end
end
