$(document).on("turbolinks:load", function(){
  $("body").on("click", "#showOwnerBtn", function(){
    $("#owner").toggle();
  });
  $("#dogs-table").dataTable();
});
/* $ -> */
/*   $('body').on 'click', '#showOwnerBtn', -> */
/*     $('#owner').toggle(); */
/*   $("#dogs-table").dataTable(); */
