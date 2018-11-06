class TiresController < ApplicationController
  def index
    @tires = Tire.all
    render json: @tires
  end

  def show
    @tire = Tire.find(params[:id])
    render json: @tire
  end
end
