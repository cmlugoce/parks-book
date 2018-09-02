$(document).on('click', ".js-more", function(event) {
  event.preventDefault();
    let id = $(this).attr("data-id");
   // debugger
    $.get("/parks/" + id + ".json", function(park) { 
   $("#location-" + id).html(park.location);
 });
});




$(function() {
  // in the formula div, when you click on .js-more ("see description" link)
  $(".js-view-parks").on('click',  function(event) {
    // this.dataset.id; grabs data-id of 'see descriptions' link, which is === formula.id
    let id = $(".js-view-parks").attr("data-id"); 
   debugger
    $.get("/parks/" + id + ".json", function(data) {
     // debugger
      // pass data to loadUserPArks
      loadUserParks(data);
    })
    event.preventDefault();
  })
});
function loadUserParks(data) {

 let parks = data["park"];
 let usersParksDiv = $(".usersParks");
 debugger
// empty the div first
usersParksDiv.empty();
debugger
// set json to variables
let userID = data["id"];
let name = data["name"];
debugger

// iterate over each formula in the formulas array
$.each (parks, function(index, park) {
debugger
  usersParksDiv.append(
    `<div class='row'>
      <div class='col-sm-8'>
        <h5><a href='/parks/${park.id}'>${park.name}</a></h5>
      
    </div>
    <hr>`
  )
});
}