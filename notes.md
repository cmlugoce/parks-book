<!-- <p>Posted by: <%= link_to park.user.name, user_path(park.user) %> </p> -->




-Add next/prev buttons to parks/show
-render in trail list

 
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
        <h3><a href='/trails/${trail.id}'>${trail.name}</a></h3>
        <h4>Difficulty: ${trail.difficulty}</h4>
        </div>
        <div class='col-sm-4'>
         
            <img src='${trail.image}'>
          
        </div>
    </div>
    <hr>`
    
  )
  //return false
});
}

add this in the future 'comments view'

<p class="text-muted">Added  on
     <%= l(comment.created_at, format: '%B, %d %Y %H:%M:%S') %></p>
     <% if current_user == comment.user %>
     <span class='js-remove' ><%= link_to '',trail_comment_path(@trail, comment), method: :delete,
     data: { confirm: 'Are you sure?' }, class: 'glyphicon glyphicon-trash' %> </span>
   <% end %>

   ////////////View parks on 'users/show'//////////////

$(function() {
    $(".js-view-parks").on('click',  function(event) {
      //debugger
    //  let id = $(".js-view-trails").attr("data_id"); 
     let id = event.target.getAttribute("data_id");
   //  debugger
      $.get("/users/" + id, function(data) {
      console.log(data)
        // pass data to loadUsersParks
        loadUsersParks(data);
      },"json")
      event.preventDefault();
    })
  });