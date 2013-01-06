jQuery ->
  $('.image-pane').hide()
  $("a[rel=show-image-select]").click( ->
    $('.image-pane').toggle()
  )
  $("a[rel=popover]").popover({content: $('.accordion') })
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
