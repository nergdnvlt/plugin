# frozen_string_literal: true

# External API Endpoint to create a new user off the FS Remote License Call

class Api::V1::UsersController < ApiController
  def create
    user = User.find_or_create_by(email: params[:email])
    user.first_name = params[:name].split[0] if user.first_name == nil
    user.last_name = params[:name].split[1] if user.last_name == nil
    user.save!
    render plain: "", status: 200
  end
end