// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


/////////////truncate 'trails/index'////////////////////
$(document).on('click', ".js-more", function(event) {
  event.preventDefault();
    let id = $(this).attr("data-id");
   // debugger
    $.get("/trails/" + id + ".json", function(trail) { 
   $("#description-" + id).html(trail.description);
 });
});



