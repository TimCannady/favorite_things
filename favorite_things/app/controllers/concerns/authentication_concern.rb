module AuthenticationConcern
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    helper_method :logged_in?
  end

  def current_user
    return nil if session[:user_id].blank?
    @current_user ||= User.where(user_id: session[:user_id]).first
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in
    @user = User.find_by(email: params[:email])
    session[:user_id] = @user.id
  end

  def valid_login?
    @user = User.find_by(email: params[:email])
    if @user.password == params[:password]
      return true
    else
      return false
    end
  end

  def log_out
    session[:user_id].clear
  end

  def sign_up
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      city: params[:city],
      gender: params[:gender],
      photo_url: params[:photo_url])
    user.password = params[:password]
    user.save!
  end

  # def user_has_liked?
  #   all_items[item_id]
  # end


end
