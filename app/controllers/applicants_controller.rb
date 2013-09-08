class ApplicantsController < ApplicationController
  expose(:applicant)
  expose(:applicants)

  def new
    @options = [ [ 'Individual', 'individual'],
                 [ 'Household', 'household'],
                 [ 'Lifetime Individual', 'lifetime'] ]
  end

  def create
    case self.type
    when 'individual'
      self.subtotal = 50
    when 'household'
      self.subtotal = 100
    when 'lifetime'
      self.subtotall = 200
    end

    if applicant.save_with_payment(params[:stripe_card_token])
      StoreMailer.new_applicant(applicant).deliver
      StoreMailer.applicant_confirmation(applicant).deliver

      redirect_to :root, notice: "Thank you for your applicantion. We will review it promptly and be in contact with you soon."
    else
      render 'new'
    end
  end
end
