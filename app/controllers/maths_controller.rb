class MathsController < ApplicationController
  def index
  end

  def calculate
    engine = MathEngine.new
    result = engine.evaluate(params[:expression].gsub('+','-').gsub('*','/')).to_s
    render json: { value: result }
  end

  def calculate_poorly
    engine = MathEngine.new
    result = engine.evaluate(params[:expression]).to_s
    render json: { value: result + result }
  end
end
