class CommentsController < ApplicationController
  before_action :require_login
 # before_action :set_trail
  
      def create
        @trail = Trail.find(params[:trail_id])
        @comment = @trail.comments.new(comment_params)
      
        if @comment.save!
          #format.html { redirect_to @trail, flash[:notice] 'Comment was successfully created.' }
          format.json { render json: @comment, status: 201}
        else
          #format.html { redirect_to @trail, notice: "You can't leave the comment box blank.Please try again!" }
          format.json { render json: @comment.errors, status:400 }        
        end
      end
     
      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        respond_to do |format|
          format.html { redirect_back fallback_location: root_path, notice: 'Comment was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
      
 private
 
 def set_trail
  @trail = Trail.find(params[:trail_id])
 end 


 def comment_params
    params.require(:comment).permit(:body, :user_id, :trail_id)
  
 end 
end 