# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.fs_id
      redirect_to user_path(@user.fs_id)
    else
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
