class BlurbsController < ApplicationController
  
  before_filter :require_admin

  expose(:blurb)
  expose(:page) { Page.find(blurb.page_id || params[:page_id]) }
  expose(:new_blurb) { page.blurbs.create(params[:blurb]) }

  def create

    if new_blurb.save
      redirect_to slug_path(page.slug), notice: "Blurb successfully created."
    else
      render 'new'
    end
  end

  def update
    if blurb.save

      redirect_to slug_path(page.slug), notice: "Blurb successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    blurb.destroy
    redirect_to slug_path(page.slug), notice: "#{blurb.name} was deleted."
  end
end
