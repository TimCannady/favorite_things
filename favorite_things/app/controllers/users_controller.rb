class UsersController < ApplicationController

  def home
    if current_user == nil
      redirect_to login_signup_path
    else
      redirect_to users_path
    end
  end

end
