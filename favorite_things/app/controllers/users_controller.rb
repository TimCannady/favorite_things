class UsersController < ApplicationController

  def home
    if current_user = nil
      redirect_to login_path
    else
      redirect_to user_show_path
  end

end
