class SessionsControllerController < ApplicationController

  def create
    if valid_login?
      log_in
      # redirect_to home
    else
      raise ArgumentError, "wrong password"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
