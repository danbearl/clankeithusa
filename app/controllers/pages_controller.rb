class PagesController < ApplicationController

  before_filter :require_admin, only: [:new, :create, :edit, :destroy, :index]

  expose(:page, finder: :find_by_slug, finder_parameter: :slug)
  expose(:new_page, model: Page)
  expose(:images) { page.images }
  expose(:sub_pages) {page.sub_pages.reorder(:priority) }

  def create
    if new_page.save
      redirect_to slug_path(new_page.slug)
    else
      render 'new'
    end
  end

  def update
    if page.save
      redirect_to slug_path(page.slug)
    else
      render 'edit'
    end
  end

  def destroy
    page.destroy
    redirect_to :root, message: "#{page.name} was deleted."
  end

end
