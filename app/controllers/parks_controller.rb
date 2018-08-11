class ParksController < ApplicationController
    before_action :logged_in?, only: [:index, :edit, :update, :destroy]
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

    def destroy
        @park = Park.find(params[:id])
        @park.destroy
        redirect_to parks_path
    end 

    private 
    def park_params
        params.require(:park).permit(:name, :location, :user_id)
      end




end
