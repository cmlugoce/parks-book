$(document).ready(function(){
    $(".comment-link").on("click", function(event) {
        event.preventDefault();
        $(this).show();                        // show the button
        $(".comment-sec").show();   // Show the form parent
      });
    });

      $(function (){
       $("#new_comment").on("submit", function(event){
      
       
        
         $.ajax({
             type: "POST",
             url: this.action, // this refers to whatever triggered the action === [object HTMLFormElement]
             data: $(this).serialize(), // takes our form data and serializes it
             success: function(response) {
      // on success, update the DOM with response in the form of data
                let comment = new Comment(response);
                comment.renderComments();
                $(".commentBox").val("");
              }
            });
            event.preventDefault();
            
        })
      });



      function Comment(data) {
       this.id = data.id;
       this.body = data.body;
       this.user = data.user;
      };

      $(function (){
        $('.js-edit').on("click", function(){
        commentIdEdit = parseInt($(this).attr('data-id'));
       // $('#comment-' + commentIdEdit).load '/comments/' + commentIdEdit + '/edit'

       
        })
    });

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

   
