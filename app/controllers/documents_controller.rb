class DocumentsController < ApplicationController
  expose(:documents)
  expose(:document)
  expose(:owner) { Page.find(document.page_id) }

  def create
    if document.save
      if document.page_id != 0 and document.page_id != nil
        redirect_to slug_path(owner.slug), notice: "Document successfully created."
      else
        redirect_to documents_path, notice: "Document succesfully created."
      end
    else
      render "new"
    end
  end

  def update
    if document.save
      if document.page_id != 0 and document.page_id != nil
        redirect_to slug_path(owner.slug), notice: "Document successfully updated."
      else
        redirect_to documents_path, notice: "Document succesfully updated."
      end
    else
      render "edit"
    end
  end

  def destroy
    document.destroy
    redirect_to documents_path, notice: "Document successfully deleted."
  end
end
