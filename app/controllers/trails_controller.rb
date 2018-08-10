class TrailsController < ApplicationController
    before_action :set_trail, only: [:show, :edit, :update, :destroy]

    def index
      @trails = Trail.all
    end
  
    def new
      @trail = Trail.new
  
    end
  
    def show
     
    end
  
    def create

     @trail = Trail.new(trail_params)
      @trail = current_user.trails.new(trail_params)
      @park = Park.find(params[:id])
      @trail.park_id = @park.id
      
      
      if @trail.save!
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
        redirect_to trails_path(@trail)
      else
        render :edit
      end
  
    end
  
    def destroy
      @trail.destroy
      redirect_to park_trails_path
  
    end
  
    private
  
    def set_trail
      @trail = Trail.find_by_id(params[:id])
  
    end
  
    def trail_params
      params.require(:trail).permit(:name, :image, :distance, :date, :description, :user_id)
    end
  end
