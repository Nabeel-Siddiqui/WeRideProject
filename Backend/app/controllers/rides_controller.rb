class RidesController < ApplicationController

    before_action :set_ride, only: [:show, :edit, :update, :destroy]

    def index
        @rides = Ride.all 
        render json: @rides
    end

    def show
        @ride = Ride.find(params[:id])
        render json: @ride
    end

    def new
        @ride = Ride.new
        render json: @ride
    end

    def create
        @ride = Ride.create(ride_params)
        # redirect_to @ride
        render json: @ride
    end 
    
    def edit
        render json: @ride
    end

    def update
        @ride.update(ride_params)
        # redirect_to @ride
        render json: @ride
    end
    
    def destroy
        @ride.destroy
        # redirect_to rides_path
        render json: @ride
    end
    
    private

    def ride_params
        params.require(:ride).permit(:start, :end, :driver_id,:rider_id)
    end
    
    def set_ride
        @ride = Ride.find(params[:id])
    end
end

