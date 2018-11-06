class CarsController < ApplicationController
  def index
    @cars = Car.all
    render json: @cars.to_json(include: [:tires])
  end

  def show
    @car = Car.find(params[:id])
    render json: @car.to_json(include: [:tires])
  end
end
