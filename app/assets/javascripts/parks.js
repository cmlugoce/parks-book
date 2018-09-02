
///////////truncate parks index////////////////
$(document).on('click', ".js-more", function(event) {
  event.preventDefault();
    let id = $(this).attr("data-id");
   // debugger
    $.get("/parks/" + id + ".json", function(park) { 
   $("#location-" + id).html(park.location);
 });
});


////////////View trails on 'parks/show'//////////////

$(function() {
  $(".js-view-trails").on('click',  function(event) {
    //debugger
  //  let id = $(".js-view-trails").attr("data_id"); 
   let id = event.target.getAttribute("data_id");
 //  debugger
    $.get("/parks/" + id + ".json", function(data) {
     // debugger
      // pass data to loadUserTrails
      loadUserTrails(data);
    })
    event.preventDefault();
  }.bind(this))
});
function loadUserTrails(data) {

 let trails = data["trails"];
 let usersTrailsDiv = $(".parksTrails");
 debugger
// empty the div first
usersTrailsDiv.empty();
//debugger
// set json to variables
let trailID = data["id"];
let name = data["name"];
let image = data["image"];
//debugger

// iterate over each  in the  array
$.each (trails, function(index, trail) {
//debugger
  usersTrailsDiv.append(
    `<div class='row'>
      <div class='col-sm-8'>
        <h3><a href='/trails/${trail.trailID}'>${trail.name}</a></h3>
        <h4>Difficulty: ${trail.difficulty}</h4>
        </div>
        <div class='col-sm-4'>
         
            <img src='${trail.image}' alt='testing'>
          
        </div>
    </div>
    <hr>`
    
  )
  //return false
});
}