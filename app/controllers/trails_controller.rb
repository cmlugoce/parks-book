class TrailsController < ApplicationController
    before_action :set_trail, only: [:show, :edit, :update, :destroy]

    def index
      @trails = Trail.all
    end
  
    def new
      @trail = Trail.new
  
    end
  
    def show
      if current_user
        @comment = current_user.comments.build(trail: @trail)
      end
     
    end
  
    def create
      
      @park = Park.find(params[:trail][:park_id])
     
      @trail = @park.trails.new(trail_params)
      
      if @trail.save
        flash[:msg] = "Trail created!"
        redirect_to trail_path(@trail)
  
      else
        render :new
      end
   
  end
  
    def edit
    end
  
    def update
      @trail.update(trail_params)
      if @trail.save
        flash[:msg] = "Trail updated!"
        redirect_to trails_path(@trail)
      else
        render :edit
      end
  
    end
  
    def destroy
      @trail.destroy
      flash[:msg] = "Trail deleted!"
      redirect_to trails_path
  
    end
  
    private
  
    def set_trail
      @trail = Trail.find_by_id(params[:id])
  
    end
  
    def trail_params
      params.require(:trail).permit(:name, :image, :distance, :date, :description, :user_id)
    end
  end
