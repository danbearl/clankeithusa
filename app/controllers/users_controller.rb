class UsersController < ApplicationController

  before_filter :require_admin, only: [:new, :create, :destroy]
  before_filter :require_user, only: [:show, :edit, :update]

  expose(:users)
  expose(:user)
  expose(:new_user, model: User)

  def create
    if new_user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render "new"
    end
  end
  
  def update
      if user.save
        redirect_to users_path, notice: 'User was successfully updated.'
      else
        render action: "edit"
      end
  end

  def destroy
    user.destroy
    redirect_to users_path, notice: 'User successfully deleted.'
  end
end
