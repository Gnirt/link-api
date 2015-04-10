class Api::V1::AuthenticatesController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user_from_token!
  skip_before_filter :authenticate_user!

  def authenticate
    @user = User.find_by_email(params[:email])

    if @user.valid_password? params[:password]
      render json: @user.authentication_token
    else
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: 'Bad password or email', status: 401
    end
  end

end
