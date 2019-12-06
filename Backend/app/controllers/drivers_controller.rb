class DriversController < ApplicationController
    
    before_action :set_driver, only: [:show, :edit, :update, :destroy]
    
    def index
        @drivers = Driver.all
        render json: @drivers
    end
    
    def show
        render json: @driver
    end
    
    def new
        @driver = Driver.new
        render json: @driver
    end

    def create
        @driver = Driver.create(driver_params)
        redirect_to @driver
        render json: @driver
    end 
    
    def edit
        render json: @driver
    end

    def update
        @driver.update(driver_params)
        redirect_to @driver
        render json: @driver
    end
    
    def destroy
        @driver.destroy
        redirect_to drivers_path
        render json: @driver
    end
    
    private

    def driver_params
        params.require(:driver).permit(:name, :car, :rating, :image)
    end
    
    def set_driver
        @driver = Driver.find(params[:id])
    end
end
