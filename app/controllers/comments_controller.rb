class CommentsController < ApplicationController
   
    
      
      def create
        @trail = Trail.find(params[:trail_id])
        @comment = @trail.comments.create(comment_params)
      
        if @comment.save
          flash[:success] = 'Your comment was successfully added!'
          redirect_to trail_path(@trail)
        else
          render 'new'
        end
      end
      
    
 private
 


 def comment_params
    params.require(:comment).permit(:body)
  
 end 
end 