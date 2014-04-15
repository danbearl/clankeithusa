class PagesController < ApplicationController

  before_filter :require_admin, only: [:new, :create, :edit, :destroy, :index]

  expose(:page, finder: :find_by_slug, finder_parameter: :slug)
  expose(:pages_with_drafts) { Page.all }
  expose(:images) { page.images }
  expose(:blurb_associations) { page.blurb_associations }
  expose(:sub_pages) {page.sub_pages.reorder(:priority) }
  expose(:top_pages) { Page.where(parent_id: 0) }

  def show
    if page.category == 'section'
      if !page.sub_pages.blank?
        redirect_to slug_path(sub_pages.first.slug)
      end
    end
  end

  def new
    page.blurb_associations.build
  end

  def create
    if page.save
      if page.draft
        redirect_to pages_path, notice: "Draft successfully created."
      else
        redirect_to slug_path(page.slug), notice: "Page successfully created."
      end
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

  def restore
    page = Page.find_by_slug(params[:slug])
    page = page.versions.where(id: params[:version_id]).first.reify

    if(page.save)
      redirect_to pages_path, notice: "Page restored."
    else
      redirect_to page_versions_path(page.slug), notice: "An error occurred while attempting to restore the version."
    end
  end
end
