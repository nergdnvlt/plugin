# frozen_string_literal: true

# External API Endpoint to create a new user off the FS Remote License Call

class Api::V1::UsersController < ApiController
  before_action :user, only: [:update]

  def create
    user = User.find_or_create_by(fs_id: user_params[:id])
    if user.save!
      render json: {"message": "user created" }, status: 200
    else
      render json: {"message": "user not created" }, status: 500
    end
  end

  def update
    user = User.find_by(fs_id: params[:events][0][:data][:account][:id])
    binding.pry
    user.first_name = user[:first_name]
    user.last_name = user[:last_name]
    user.email = user[:email]
    if user.save!
      render json: {"message": "user updated" }, status: 200
    else
      render json: {"message": "user not updated" }, status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end

  def user
    {
      first_name: params[:events][0][:data][:customer][:first],
      last_name: params[:events][0][:data][:customer][:last],
      email: params[:events][0][:data][:customer][:email]
    }
  end
end