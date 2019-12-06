class RidersController < ApplicationController

    before_action :set_rider, only: [:show, :edit, :update, :destroy]

    def index
        @riders = Rider.all 
        render json: @riders
    end

    def show
        render json: @rider
    end

    def new
        @rider = Rider.new
        render json: @rider
    end

    def create
        @rider = Rider.create(rider_params)
        redirect_to @rider
        render json: @rider
    end 
    
    def edit
        render json: @rider
    end

    def update
        @rider.update(rider_params)
        redirect_to @rider
        render json: @rider
    end
    
    def destroy
        @rider.destroy
        redirect_to riders_path
        render json: @rider
    end
    
    private

    def rider_params
        params.require(:rider).permit(:name, :rating, :image)
    end
    
    def set_rider
        @rider = Rider.find(params[:id])
    end

end
