# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#spouse_deceased").change ->
    toggleDisabled('#applicant_spouse_death_date')
    toggleDisabled('#applicant_spouse_death_place')


  toggleDisabled = (id) ->
    if $(id).attr('disabled') == undefined || $(id).attr('disabled') == false
      $(id).attr('disabled', true)
    else
      $(id).attr('disabled', false)
