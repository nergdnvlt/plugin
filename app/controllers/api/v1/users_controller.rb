# frozen_string_literal: true

# External API Endpoint to create a new user off the FS Remote License Call

class Api::V1::UsersController < ApiController
  def create
    User.find_or_create_by(id: user_params[:id])
    render plain: "", status: 200
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end
end