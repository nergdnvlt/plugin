class UsersController < ApplicationController
  def show
    @user = User.find_by(fs_id: params[:slug])
  end
end
