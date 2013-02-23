# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#new_applicant").delegate '.checkbox', 'change', (evt) ->
    name = $(this).attr("id").split("_")
    name.pop()
    name = name.join('_')

    toggleDisabled('#applicant_' + name + '_death_date')
    toggleDisabled('#applicant_' + name + '_death_place')


  toggleDisabled = (id) ->
    if $(id).attr('disabled') == undefined || $(id).attr('disabled') == false
      $(id).attr('disabled', true)
    else
      $(id).attr('disabled', false)
