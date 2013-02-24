class JoinController < ApplicationController

  def new
    @applicant = Applicant.new

    @options = [ [ 'Individual', 'individual'],
                 [ 'Household', 'household'],
                 [ 'Lifetime Individual', 'lifetime'] ]
  end

  def create
    @applicant = Applicant.new(params[:applicant])

    if @applicant.valid?
      StoreMailer.new_applicant(@applicant).deliver

      redirect_to :root, notice: "Thank you for your applicantion. We will review it promptly and contact you with a response."
    else
      render 'new'
    end
  end
end
