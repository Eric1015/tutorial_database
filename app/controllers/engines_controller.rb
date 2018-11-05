class EnginesController < ApplicationController
  def index
    @engines = Engine.all
    render json: @engines
  end

  def show
    @engine = Engine.find(params[:id])
    render json: @engine
  end
end
