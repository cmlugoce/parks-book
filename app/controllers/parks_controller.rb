class ParksController < ApplicationController

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
        @park = current_user.parks.new(park_params)
        if @park.save!
            redirect_to park_path(@park)
        else
            render :new 
        end
    end 

    def edit 
        @park = Park.find(params[:id])
    end 

    def update
        @park = Park.find(params[:id])
        if @park.update!(park_params)
        redirect_to park_path(@park)
        end 
    end 

    private 
    def park_params
        params.require(:park).permit(:name, :location, :user_id)
      end




end
