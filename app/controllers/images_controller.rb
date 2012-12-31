class ImagesController < ApplicationController

  expose(:images)
  expose(:image) 
  expose(:owner) { image.imageable }

  def new
    @imageable_id = params[:imageable_id]
    @imageable_type = params[:imageable_type]
  end

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
