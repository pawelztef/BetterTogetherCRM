$ ->
  $('body').on 'click', '#showOwnerBtn', ->
    $('#owner').toggle();
  $("#dogs-table").dataTable();
