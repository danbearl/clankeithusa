class UserSessionsController < ApplicationController

  skip_before_filter :require_user, except: :destroy

  def create
    if sign_in(params[:email], params[:password])
      redirect_back_or_to(root_path)
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path, notice: "Logged out successfully."
  end
end
