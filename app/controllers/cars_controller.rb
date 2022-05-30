class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(list_params)
    @car.user = current_user
    if @car.save
      redirect_to car_path(@car), notice: 'You are successful'
    else
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
  end

  private

  def list_params
    params.require(:car).permit(:make, :model, :price_day)
  end
end
