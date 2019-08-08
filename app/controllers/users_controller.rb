class UsersController < ApplicationController
  def show
    @user = User.find_by(fs_id: params[:slug])
    session[:user_id] = @user.fs_id if @user
  end
end
