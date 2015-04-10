class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  # This is our new function that comes before Devise's one
  before_filter :authenticate_user_from_token!

  rescue_from ActiveRecord::RecordNotFound do
    flash[:warning] = 'Resource not found.'
    redirect_back_or root_path
  end

  def redirect_back_or(path)
    redirect_to request.referer || path
  end

  private

  def authenticate_user_from_token!
    # Set the authentication token params if not already present,
    if user_token = params[:user_token].blank? && request.headers["X-User-Token"]
      params[:user_token] = user_token
    end
    if user_email = params[:user_email].blank? && request.headers["X-User-Email"]
      params[:user_email] = user_email
    end
    user_email = params[:user_email].presence
    user       = user_email && User.find_by_email(user_email)
    # Notice how we use Devise.secure_compare to compare the token
    # in the database with the token given in the params, mitigating
    # timing attacks.
    if user && Devise.secure_compare(user.authentication_token, params[:user_token])
      sign_in user, store: false
    # else
    #   self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    #   render json: 'Bad credentials', status: 401
    end
  end
end
