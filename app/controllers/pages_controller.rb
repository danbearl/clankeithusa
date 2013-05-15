class PagesController < ApplicationController

  before_filter :require_admin, only: [:new, :create, :edit, :destroy, :index]

  expose(:page, finder: :find_by_slug, finder_parameter: :slug)
  expose(:images) { page.images }
  expose(:blurb_associations) { page.blurb_associations }
  expose(:sub_pages) {page.sub_pages.reorder(:priority) }

  def new
    page.blurb_associations.build
  end

  def create
    if page.save
      redirect_to slug_path(page.slug), notice: "Page successfully created."
    else
      render 'new'
    end
  end

  def edit
    page.blurb_associations.build
  end

  def update
    if page.save
      redirect_to slug_path(page.slug), notice: "Page successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    page.destroy
    redirect_to :root, notice: "Page successfully deleted."
  end

end
