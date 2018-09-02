class ParksController < ApplicationController
        
    before_action :set_park, only: [:show, :edit, :update, :destroy]
    skip_before_action :require_login, only: [:index]
    def index 
        @parks = Park.all 
        respond_to do |format|
            format.html { render :index }
            format.json { render json:  @parks }
        end
    end 

    def show 
        respond_to do |format|
            format.html { render :show }
            format.json { render json:  @park }  
        end  
        
    end 

    def new
        @park = Park.new
    end 

    def create 
        
        @park = current_user.parks.build(park_params)
        if @park.save
            flash[:msg] = "Park created!"
            redirect_to park_path(@park)
        else
            render :new 
        end
    end 

    def edit 
       
    end
    def update
        
        @park = current_user.parks.find(params[:id])
        if @park.update(park_params)
        flash[:msg] = "Park updated."
        redirect_to park_path(@park)
        end 
    end 

    def parks_by_location
        list = Park.search(params[:search]).order("created_at DESC")
        if !list.empty?
          @parks = list
        else
          flash[:notice] = "There are no parks matching the input."
          redirect_to parks_path
        end
      end

      def parks_by_name
        list = Park.search4(params[:search]).order("created_at DESC")
        if !list.empty?
          @parks = list
        else
          flash[:notice] = "There are no parks matching the input."
          redirect_to parks_path
        end
      end

    def destroy
        @park = current_user.parks.find(params[:id])
        @park.destroy
        flash[:msg] = "Park deleted!"
        redirect_to parks_path
    end 

    private 

    def set_park
        @park = Park.find(params[:id]) 

    end 
    def park_params
        params.require(:park).permit(:name, :location, :image, :remove_image, :user_id)
      end




end
