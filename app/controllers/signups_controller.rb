class SignupsController < ApplicationController
  def create
    new_signup = Signup.create!(signup_params)
    render json: new_signup.activity, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  
  end

  private

  def signup_params
    params.permit(:time, :activity_id, :camper_id)
  end
end
