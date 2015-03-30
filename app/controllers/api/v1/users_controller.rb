class Api::V1::UsersController < Api::V1::BaseController
  respond_to :json
  skip_before_filter :authenticate_user_from_token!, only: [:create]
  skip_before_filter :authenticate_user!, only: [:create]

  private

  def user_params
    params.require(:user).permit(
        :username,
        :password,
        :email,
        :admin_id
    )
  end

  def query_params
    params.permit(
        :username,
        :email,
        :admin_id,
        :authentication_token
    )
  end
end
