





/////////////////////view next/prev/////////////////////

$(function(){
  $(".js-previous-park").on("click", function (event) {
    let id = event.target.getAttribute("data-id");
      debugger
  $.get("/parks/" + id + "/previous", function(data) {
  // console.log(data)
    debugger
   loadPark(data);
   
  });
  event.preventDefault();
  
 })
})

$(function(){
  $(".js-next-park").on("click", function (event) {
    let id = event.target.getAttribute("data-id");
      debugger
  $.get("/parks/" + id + "/next", function(data) {
  // console.log(data)
    debugger
   loadPark(data); //declaration
   
  });
  event.preventDefault();
  
 })
})

function loadPark(data) {
  
  // change the URL to the new route
  history.pushState({}, "", "/parks/" + data.id)
  
  // reset the id to current on the buttons
  $(".js-next-park").attr("data-id", data["id"]);
  $(".js-previous-park").attr("data-id",data["id"]);
  
debugger

  let parkHeader = $(".park-header")
  let parkPage = $("#parkImage")
  
  // empty the div

  parkHeader.empty()
  parkHeader.append(
  
    "<center>"+
  " <h1> Park Name:" + (data["name"])+"</h1><br>"+
  "<h3 class='item1'>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Location: &nbsp;&nbsp;&nbsp;"+(data["location"])+"</h3>"
   + "</center>"  
)
  // empty the div
  
  parkPage.empty()
  parkPage.append(
    
     
     
   " <br></br>" +
    
`<img src='${data.image}'>`+

"</div>"
)
    


let trails = (data["trails"])

//let userName = data["user"]["name"]
//let parkID = data["id"]
//let userID = data["user"]["id"]
let parkTrail = $("#park")
debugger

parkTrail.empty()
$.each (trails, function(index, trail){
 debugger
 
  parkTrail.append(
  
 `<center>
  <h3><a href='/trails/${trail.id}'>${trail.name}</a></h3>
  </center>
  </div>
  </div>
  </div>
  </div>

  `
    )  
   })
}
