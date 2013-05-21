jQuery ->
  $('#image-pane').hide()
  $('#document-pane').hide()

  $("a[rel=show-image-select]").click( ->
    $('#image-pane').toggle()
    if $('#document-pane').is(':visible')
      $('#document-pane').hide()
  )

  $("a[rel=show-document-select]").click( ->
    $('#document-pane').toggle()
    if $('#image-pane').is(':visible')
      $('#image-pane').hide()
  )

  $("a[rel=popover]").popover({content: $('.accordion') })

  $(".tooltip").tooltip()

  $("a[rel=tooltip]").tooltip()

  $(".datepicker").datepicker({
    changeMonth: true,
    changeYear: true,
    dateFormat: 'yy-mm-dd'
  })

  $('#imageCarousel').carousel()

  $('#announcementsCarousel').carousel(
    interval: 10000
  )
