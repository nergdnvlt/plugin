class UsersController < ApplicationController
  def show
    binding.pry
    @user = User.find_by(fs_id: params[id])
  end
end
