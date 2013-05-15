class BlurbsController < ApplicationController
  
  before_filter :require_admin

  expose(:blurb)
  expose(:blurbs)

  def create

    if blurb.save
      redirect_to blurbs_path, notice: "Blurb successfully created."
    else
      render 'new'
    end
  end

  def update
    if blurb.save

      redirect_to blurbs_path, notice: "Blurb successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    blurb.destroy
    redirect_to blurbs_path, notice: "#{blurb.name} was deleted."
  end
end
