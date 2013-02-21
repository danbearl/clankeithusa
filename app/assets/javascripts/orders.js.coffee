# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  order.setupForm()

order =
  setupForm: ->
    $('#new_order').submit ->
      order.clearErrors()
      $('input[type=submit]').attr('disabled', true)
      if !order.validateCustomerInfo()
        order.processCard()
      else
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
      $('#stripe_card_token').val(response['id'])
      $('#new_order')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)

  validateCustomerInfo: ->
    email = new RegExp(/^\S+@\S+$/)
    zip = new RegExp(/^\d{5}(?:[-\s]\d{4})?$/)

    errors = false
    if $('#order_customer_first_name').val().length < 1
      errors = true
      $('#first_name_error').text("First name cannot be blank.")
    if $('#order_customer_last_name').val().length < 1
      errors = true
      $('#last_name_error').text("Last name cannot be blank.")
    if !email.test($('#order_email').val())
      errors = true
      $('#email_error').text("Please enter a valid e-mail address.")

    if $('#order_address_street_1').val().length < 1
      errors = true
      $('#address_street_error').text("Please enter a valid street address.")

    if $('#order_address_city').val().length < 1
      errors = true
      $('#address_city_error').text("Please enter a valid city.")

    if $('#order_address_state').val().length < 1
      errors = true
      $('#address_state_error').text("Please enter a valid state.")

    if !zip.test($('#order_address_zip').val())
      errors = true
      $('#address_zip_error').text("Please enter a valid zip code.")

    return errors

  clearErrors: ->
    $('#first_name_error').text("")
    $('#last_name_error').text("")
    $('#email_error').text("")
    $('#address_street_error').text("")
    $('#address_city_error').text("")
    $('#address_state_error').text("")
    $('#address_zip_error').text("")

