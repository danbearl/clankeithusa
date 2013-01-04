class UserSessionsController < ApplicationController

  skip_before_filter :require_user, except: :destroy

  def create
    if sign_in(params[:email], params[:password])
      redirect_back_or_to(root_path)
    else
      render :new
    end
  end
end
