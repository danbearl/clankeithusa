class CommentsController < ApplicationController
  before_filter :require_admin, only: [:edit, :update, :destroy]

  expose(:comments)
  expose(:comment)
  expose(:unapproved_comments) { comments.find_all { |comment| !comment.approved } }
  expose(:approved_comments) { comments.find_all { |comment| comment.approved } }

  def create
    if comment.save
      redirect_to :root, notice: "Thank you for your comment!"
    else
      render 'new'
    end

  end

  def approve
    comment.approve

    redirect_to comments_path

  end

  def destroy
    comment.destroy
    redirect_to comments_path, notice: "Comment deleted."

  end

end
