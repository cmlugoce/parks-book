class CommentsController < ApplicationController
  before_action :logged_in?
  before_action :validate_user
      
      def create
        @trail = Trail.find(params[:trail_id])
        @comment = @trail.comments.new(comment_params)
      
        if @comment.save!
          flash[:msg] = 'Your comment was successfully added!'
          redirect_to trail_path(@trail)
        else
          flash[:notice] = "Error creating comment: #{@comment.errors}"
          redirect_to trail_path(@trail)
        end
      end

      
 private
 


 def comment_params
    params.require(:comment).permit(:body, :user_id, :trail_id, user_attributes:[:name])
  
 end 
end 