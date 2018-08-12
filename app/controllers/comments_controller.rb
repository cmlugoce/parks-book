class CommentsController < ApplicationController
   
    

 def create
    
 private

 def comment_params
    params.require(:comment).permit(:body, :user_id)
  
 end 
end 