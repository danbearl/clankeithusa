jQuery ->
  $("a[rel=popover]").click( ->
    $('.accordion').show()
  )
  $('.accordion').hide()
  $("a[rel=popover]").popover({content: $('.accordion') })
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
