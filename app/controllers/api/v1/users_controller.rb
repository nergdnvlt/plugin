# frozen_string_literal: true

# External API Endpoint to create a new user off the FS Remote License Call

class Api::V1::UsersController < ApiController
  def create
    user = User.find_or_create_by(fs_id: user_params[:id])
    binding.pry
    if user.save!
      render json: {"message": "user created" }, status: 200
    else
      render status: 500
    end
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end
end