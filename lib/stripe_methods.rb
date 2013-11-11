module StripeMethods
  def save_with_payment(stripe_card_token, total_in_cents)
    if valid?
      payment_response = Stripe::Charge.create(
        amount: total_in_cents,
        currency: "usd",
        card: stripe_card_token,
        description: "Charge for #{email}"
      )

      self.stripe_payment_token = payment_response.id
      save!
    end

  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while processing payment: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
  end

end
