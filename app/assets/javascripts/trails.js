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



//////////////////set up next and previous ///////////////////////////


function loadTrails(data) {
  history.pushState({}, "", "/trails/" + data.id)
  var trailCommentPath = '/trails/' + data.id + '/comments/';
  $("#new_comment").attr('action', trailCommentPath);
  $(".trailName").text(data["name"]);
    $(".trailPark").text(data["park"]["name"]);
    $(".trailDistance").text(data["distance"]);
    $(".trailDate").text(data["date"]);
    $(".trailDifficulty").text(data["difficulty"]);
    $(".trailNotes").text(data["description"]);
    //debugger
    //$(".trailUserName").text(data["user"]["name"]);
    $(".js-next").attr("data-id", data["id"]);
    $(".js-previous").attr("data-id",data["id"]);
    $(".comment-sec").empty();
   data["comment_list"].forEach(function(element){
   // var comment = new Comment(element);
  //  comment.renderComments();
  });


}



    function Comment(data) {
     this.id = data.id;
     this.body = data.body;
     this.user = data.user;
    };

// this method appends html to the div id="submitted-comments"
  Comment.prototype.renderComments = function() {
 let html = "" ;
 html += 

`<div class=\'well'>
<strong>${this.user.name}</strong> says: <br></br>
 <p>${this.body}</p>

</div>`;
// debugger
 $(".comment-sec").append(html);

 
 };


//$(function(){
  //  $(".js-previous").on("click", function (event) {
         // get the id from the data-id attribute (current id) assign it to id
  //  let id = $(".js-previous").attr("data-id")
    // get previous category
   // $.get("/trails/" + id + "/previous", function(data) {
        // pass data to loadCategory
     // loadTrail(data) 
    // var url = $(this).attr("href")
    // debugger
    // nextTrail(url);
 //   }) 
        
      //  event.preventDefault();
       // debugger
     // })

    //})



   // $(function(){
     // $(".js-next").on("click", function (event) {
     // var id = $(".js-next").attr("data-id")
     // $.get("/trails/" + id + "/next", function(data) {
      // console.log(data)
        
       //loadTrail(data);
       
      //});
     // event.preventDefault();
      
    // })
   // });
   // $(function(){
     //   $(".js-next").on("click", function (event) {
           // event.preventDefault();
          // get the id from the data-id attribute (current id) assign it to id
       //   const id = $(".js-next").attr("data-id")
          // get next category
         // $.get("/trails/" + id + "/next", function(data) {
            // pass data to loadCategory
           // loadTrail(data)
         // })
        //  debugger
         // event.preventDefault();
          //alert('wepa');
       // })
     // })

     
      
     function loadTrail(data) {
        // change the URL to the new route
     history.pushState({}, "", "/trails/" + data.id)
     // debugger
    $(".js-next").attr("data-id", data["id"]);
    $(".js-previous").attr("data-id",data["id"]);
     let trail = $("#trail") 
     trail.empty()

    
      trail.append(
         "<div class='container'>"+
          "<div class='row'>"+
           "<div class='col-md-5'>"+
           "<br></br>"+
          `<img src='${data.image}' alt='testing'>`+
            
           '</div>'+



  "<div class='col-md-5' id='trailPage'>"+

  "<h2 class='trailName'> Trail Name: " + (data["name"])+ "</h2>"+
 "<h3 class='trailPark'>Park Name: "+(data["park"]["name"])+"</h3>"+
  "<h4 class='trailDistance'>Distance:&nbsp;&nbsp;&nbsp;"+(data["distance"])+ "&nbsp;miles"+"</h4>"+
 // <h4 class='trailDate'>Date:&nbsp;&nbsp;&nbsp;<%= @trail.date.strftime('%B, %d %Y') %></h4>
  "<h4 class='trailDifficulty'>Difficulty:"+ (data["difficulty"])+"</h4>"+
  "<h4 class='trailNotes'>Trail Notes: "+(data["description"])+"</h4>"+
  


   "<div class='center'>"+
  
  "</div>"+

  "<div class='box-div'>"+
  "</div>"

  
   
        )
        
        $.each(trails)
       // $(".js-next").attr("data-id", data["id"]);
        //$(".js-previous").attr("data-id",data["id"]);
    
  }
     

   //  debugger
       // var destinationCommentPath = '/trails/' + data.id + '/comments/';
     // $("#new_comment").attr('action', trailCommentPath);
   //  $(".trailName").text(data["name"]);
   //  $(".trailPark").text(data["park"]["name"]);
   //  $(".trailDistance").text(data["distance"]);
   //  $(".trailDate").text(data["trail"]["date"]);
   //  $(".trailDifficulty").text(data["trail"]["difficulty"]);
   //  $(".trailNotes").text(data["trail"]["description"]);
   //  $(".trailUserName").text(data["user"]["name"]);
   //  $(".js-next").attr("data-id", data["id"]);
   //  $(".js-previous").attr("data-id",data["id"]);
     
     


 // }; 


 // <div class="col-md-5">
//<br></br>
//<%= image_tag @trail.image.url(:medium) if @trail.image?%>
//</div>



//<div class="col-md-5" id='trailPage'>

 // <h2 class='trailName'>Trail Name: <%= @trail.name %></h2>
  //<h3 class='trailPark'>Park Name: <%= link_to @trail.park.name, park_path(@trail.park) %></h3>


 //<h4 class='trailDistance'>Distance:&nbsp;&nbsp;&nbsp;<%= @trail.distance %> miles</h4>
 //<h4 class='trailDate'>Date:&nbsp;&nbsp;&nbsp;<%= @trail.date.strftime('%B, %d %Y') %></h4>
 //<h4 class='trailDifficulty'>Difficulty: <%= @trail.difficulty %></h4>
  //<h4 class='trailNotes'>Trail Notes: <%= @trail.description %></h4>
  //<h4 class='trailUserName'>Trail User: <%= @trail.park.user.name %></h4>
  
  