class CommentsController < ApplicationController
  before_action :require_login
  
      def create
        @trail = Trail.find(params[:trail_id])
        @comment = @trail.comments.new(comment_params)
      
        if @comment.save!
           render json: @comment, status: 201
        else
          render json: {errors: @comment.errors.full_messages}, status: 400
        end
      end
     
     
      
 private
 


 def comment_params
    params.require(:comment).permit(:body, :user_id, :trail_id)
  
 end 
end 