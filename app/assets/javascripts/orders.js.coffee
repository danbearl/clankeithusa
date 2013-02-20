# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  order.setupForm()

order =
  setupForm: ->
    $('#new_order').submit ->
      $('input[type=submit]').attr('disabled', true)
      form_errors = order.validateCustomerInfo()
      if form_errors == ""
        order.processCard()
      else
        $('#form_errors').text(form_errors)
        $('input[type=submit]').attr('disabled', false)
      false

  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)

  handleStripeResponse: (status, response) ->
    if status == 200
      $('#order_stripe_card_token').val(response.id)
      $('#new_order')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)

  validateCustomerInfo: ->
    email = new RegExp(/^\S+@\S+$/)
    $('#form_errors').text("In validateCustomerInfo()")

    errors = ""
    if $('#order_customer_first_name').val().length < 1
      errors = errors + "First name cannot be blank.\n"
    if $('#order_customer_last_name').val().length < 1
      errors = errors + "Last name cannot be blank.\n"
    if !email.test($('#order_email').val())
      errors = errors + "Please enter a valid e-mail address."

    return errors

