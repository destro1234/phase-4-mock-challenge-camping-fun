class CampersController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound , with: :record_not_found

  def index
    campers = Camper.all
    render json: campers
  end

  def show
    camper = find_camper
    render json: camper, include: :activities
  end

  def create
    new_camper = Camper.create!(campers_params)
    render json: new_camper, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  
  end

  private

  def campers_params
    params.permit(:name, :age)
  end
  
  def find_camper
    Camper.find(params[:id])
  end

  def record_not_found
    render json: { error: "Camper not found" }, status: :not_found
end
end
