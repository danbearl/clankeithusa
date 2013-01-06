class ImagesController < ApplicationController

  before_filter :require_admin, except: :show

  expose(:images)
  expose(:image) 
  expose(:owner) { Page.find(image.page_id) }

  def create
    if image.save
      redirect_to slug_path(owner.slug), notice: "Image successfully created."
    else
      render "new"
    end
  end

  def update
    if image.save
      redirect_to owner, notice: "Image successfully updated."
    else
      render "edit"
    end
  end

  def destroy
    image.destroy
    redirect_to owner, notice: "Image successfully deleted."
  end
end
