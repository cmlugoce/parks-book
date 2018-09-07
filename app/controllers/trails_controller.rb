class TrailsController < ApplicationController
    before_action :set_trail, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index]

    def index
      @trails = Trail.all
      respond_to do |format|
        format.html {render :index}
        format.json {render json: @trails, status: 200}
      end
    end
  
    def new
      @trail = Trail.new
  
    end
  
    def show
      @comment = Comment.new
    if current_user
      @comment.user_id = current_user.id
    end
    respond_to do |format|
      format.html { render :show }
      format.json { render json:  @trail }
    end
  end 
    def next_trail
      @trail = Trail.find(params[:id])
      @next_trail = @trail.next
      render json: @next_trail
    end

    def previous_trail
      @trail = Trail.find(params[:id])
      @previous_trail = @trail.previous
      render json: @previous_trail
    end
  
    def create
      
      @park = Park.find(params[:trail][:park_id])
     
      @trail = @park.trails.build(trail_params)
      #raise params.inspect
      if @trail.save!
        flash[:msg] = "Trail created!"
        redirect_to trail_path(@trail.id)
  
      else
        render :new
      end
   
  end
  
    def edit
    end
  
    def update
      @trail.update(trail_params)
      if @trail.save!
        flash[:msg] = "Trail updated!"
        redirect_to trail_path(@trail)
      else
        render :edit
      end
  
    end

    def trails_by_distance
      list = Trail.search(params[:search]).order("created_at DESC")
      if !list.empty?
        @trails = list
      else
        flash[:notice] = "There are no trails matching the input."
        redirect_to trails_path
      end
    end

    def trails_by_difficulty
    list = Trail.search2(params[:search]).order("created_at DESC")
    if !list.empty?
      @trails = list
    else
      flash[:notice] = "There are no trails matching the input."
      redirect_to trails_path
    end
  end
  
    def destroy
      
     @trail.destroy
      flash[:msg] = "Trail deleted!"
      redirect_to trails_path
  
    end
  
    private
  
    def set_trail
      @trail = Trail.find(params[:id])
  
    end
  
    def trail_params
      params.require(:trail).permit(:name, :image, :remove_image, :distance, :date, :description, :difficulty, :user_id)
    end
  end
