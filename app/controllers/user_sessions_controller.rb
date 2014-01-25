class UserSessionsController < ApplicationController

  skip_before_filter :require_user, except: :destroy
  expose(:user) { User.find_by_email(params[:email]) }

  def create
    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_back_or_to(root_path, notice: "Logged in successfully.")
    else
      flash.now.alert = "Your login credentials are incorrect."
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "Logged out successfully."
  end
end
