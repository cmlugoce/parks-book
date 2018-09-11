
  function loadUsersParks(data) {
  
   let parks = data["parks"];
   //debugger
   let usersParksDiv = $(".usersParks");
  // debugger
  // empty the div first
  usersParksDiv.empty();
  //debugger
  // set json to variables
  let parkID = data["id"];
  let name = data["name"];
  let location = data["location"];
  let image = data["image"];
 // debugger
  
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
    
  });
  }
 ////////view parks alph

 $(function() {
  $(".js-view-parks-sort").on('click',  function(event) {
    
   let id = event.target.getAttribute("data_id");
 
    $.get("/users/" + id, function(data) {
    
    
    data.parks.sort(function(a, b) {
      var nameA = a.name.toUpperCase(); // ignore upper and lowercase
      var nameB = b.name.toUpperCase(); // ignore upper and lowercase
      if (nameA < nameB) {
        return -1;
      }
      if (nameA > nameB) {
        return 1;
      }
    
      // names must be equal
      return 0;
    });
    //debugger
      
      loadUsersParks(data);
    
    },"json")
    event.preventDefault();
  
  })
});