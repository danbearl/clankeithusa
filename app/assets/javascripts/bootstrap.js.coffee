jQuery ->
  $('.image-pane').hide()
  $("a[rel=show-image-select]").click( ->
    $('.image-pane').toggle()
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
