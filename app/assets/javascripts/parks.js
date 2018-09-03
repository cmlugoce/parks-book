
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
         
            <img src='${trail.image}' alt='testing'>
          
        </div>
    </div>
    <hr>`
    
  )
  //return false
});
}

/////////////////////view next/prev/////////////////////


$(function(){
  $(".js-next-park").on("click", function (event) {
    let id = event.target.getAttribute("data_id");
      debugger
  $.get("/parks/" + id + "/next", function(data) {
  // console.log(data)
    debugger
   loadPark(data);
   
  });
  event.preventDefault();
  
 })
})

function loadPark(data) {

  // change the URL to the new route
  history.pushState({}, "", "/parks/" + data.id)

  // re-set the id to current on the buttons
  $(".js-next-park").attr("data-id", data["id"]);
  $(".js-previous-park").attr("data-id",data["id"]);



  let parkPage = $(".container")
  
  // empty the div

  parkPage.empty()

  
  //$.each (trailss, function(index, trail){
  
  parkPage.append(
    //"<div class='container'>"+
     "<div class='row'>"+
      "<div class='col-md-5'>"+
      "<br></br>"+
     `<img src='${data.image}' alt='testing'>`+
       
      "</div>"+
   //  " <div class='col-md-5' id='park'>" +
    "<h2>" + "Park Name:"+ (data["name"])+"</h5><br>"+
"<h3 class='item1'>"+"Location: &nbsp;&nbsp;&nbsp;"+(data["location"])+"</h3><br>"

)
    
//let user_cur = current_user.parks.include?(@park)

let trails = (data["trails"])
let parkTrail = $("#park-trail")


//parkTrail.empty()
$.each (trails, function(index, trail){
 //debugger
  parkPage.append(
  
  `
  <div class="pull-right">

<div class="col-md-5">
  <h3><a href='/trails/${trail.id}'>${trail.name}</a></h3>
  </div>
  </div>
  `
)

})
 






}
