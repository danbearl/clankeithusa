class ApplicantsController < ApplicationController
  expose(:applicant)
  expose(:applicants)
  expose(:options) {
    [ [ '1 Year Individual - $25', '1 year individual'],
      [ '2 Year Individual - $40', '2 year individual'],
      [ '1 Year Family - $30', '1 year family'],
      [ '2 Year Family - $50', '2 year family'],
      [ 'Lifetime Individual - $250', 'lifetime'] ]
  }

  def create
    @applicant = Applicant.new(params[:applicant])

    case @applicant.membership_type
    when '1 year individual'
      @applicant.subtotal = 25
    when '2 year individual'
      @applicant.subtotal = 40
    when '1 year family'
      @applicant.subtotal = 30
    when '2 year family'
      @applicant.subtotal = 50
    when 'lifetime'
      @applicant.subtotal = 250
    end

    if applicant.valid?
      if @applicant.save_with_payment(params[:stripe_card_token], @applicant.subtotal * 100)
        StoreMailer.new_applicant(@applicant).deliver
        StoreMailer.applicant_confirmation(@applicant).deliver

        redirect_to :root, notice: "Thank you for your applicantion. We will review it promptly and be in contact with you soon."
      else
        render 'new', notice: "There was an error processing your card."
      end
    else
      render 'new', notice: "There were errors on your form."
    end
  end

  def process_applicant
    applicant.update_attribute(:processed, true)
    redirect_to applicants_path
  end

  def approve
    applicant.update_attribute(:approved, !applicant.approved)
    redirect_to applicants_path
  end

  def destroy
    applicant.delete
    redirect_to applicants_path
  end
end
