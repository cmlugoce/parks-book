////////////View parks on 'users/show'//////////////

$(function() {
    $(".js-view-parks").on('click',  function(event) {
      //debugger
    //  let id = $(".js-view-trails").attr("data_id"); 
     let id = event.target.getAttribute("data_id");
   //  debugger
      $.get("/users/" + id + ".json", function(data) {
       // debugger
        // pass data to loadUserTrails
        loadUsersParks(data);
      })
      event.preventDefault();
    }.bind(this))
  });
  function loadUsersParks(data) {
  
   let parks = data["parks"];
   debugger
   let usersParksDiv = $(".usersParks");
   debugger
  // empty the div first
  usersParksDiv.empty();
  //debugger
  // set json to variables
  let parkID = data["id"];
  let name = data["name"];
  let location = data["location"];
  let image = data["image"];
  debugger
  
  // iterate over each  in the  array
  $.each (parks, function(index, park) {
  //debugger
    usersParksDiv.append(
      `<div class='row'>
        <div class='col-sm-6'>
          <h3>Name: <a href='/parks/${park.id}'>${park.name}</a></h3>
          <h4>Location: ${park.location}</h4>
          </div>
          <div class='col-sm-3'>
         
            <img src='${park.image}' alt=''>
          
        </div>
      </div>
      <hr>`
      
    )
    //return false
  });
  }
  //<img src='${park.image}' alt='testing'>