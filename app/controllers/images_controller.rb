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
      if image.page_id != 0 and image.page_id != nil
        redirect_to slug_path(owner.slug), notice: "Image successfully updated."
      else
        redirect_to images_path, notice: "Image succesfully updated."
      end
    else
      render "edit"
    end
  end

  def destroy
    image.destroy
    redirect_to images_path, notice: "Image successfully deleted."
  end
end
