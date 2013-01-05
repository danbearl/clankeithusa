class BlurbsController < ApplicationController
  
  before_filter :require_admin, only: [:new, :create, :edit, :destroy, :index]

  expose(:blurbs)
  expose(:blurb)
  expose(:new_blurb, model: Blurb)
  expose(:parent) { Page.find(blurb.page_id) }

  def create
    if new_blurb.save
      redirect_to slug_path(parent.slug)
    else
      render 'new'
    end
  end

  def update
    if blurb.save
      redirect_to slug_path(parent.slug)
    else
      render 'edit'
    end
  end

  def destroy
    blurb.destroy
    redirect_to :root, message: "#{blurb.name} was deleted."
  end
end
