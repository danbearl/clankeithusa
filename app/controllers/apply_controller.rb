class ApplyController < ApplicationController

  def new
    @applicant = Applicant.new
  end

  def create
    @applicant = Applicant.new(params[:applicant])

    if @applicant.valid?
      StoreMailer.new_applicant(@applicant)

      redirect_to :root, notice: "Thank you for your applicantion. We will review it promptly and contact you with a response."
    else
      render 'new'
    end
  end
end
