# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    redirect_to user_path(@user.fs_id)
  end
end
