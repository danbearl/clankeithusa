module StripeMethods
  def save_with_payment(stripe_card_token)
    if valid?
      total = (100 * (shipping.to_f + subtotal.to_f)).to_i
      payment_response = Stripe::Charge.create(
        amount: total,
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
