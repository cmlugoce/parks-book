class ParksController < ApplicationController
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]
    before_action :validate_user
    def index 
        @parks = Park.all 
    end 

    def show 
        @park = Park.find(params[:id])
    end 

    def new
        @park = Park.new
    end 

    def create 
        @user = User.find(params[:user_id])
        @park = @user.parks.build(park_params)
        if @park.save
            flash[:msg] = "Park created!"
            redirect_to park_path(@park)
        else
            render :new 
        end
    end 

    def edit 
        @park = Park.find(params[:id])
    end 

    def update
        
        @park = current_user.parks.find(params[:id])
        if @park.update(park_params)
        flash[:msg] = "Park updated."
        redirect_to park_path(@park)
        end 
    end 

    def destroy
        @park = Park.find(params[:id])
        @park.destroy
        flash[:msg] = "Park deleted!"
        redirect_to parks_path
    end 

    private 
    def park_params
        params.require(:park).permit(:name, :location, :user_id)
      end




end
