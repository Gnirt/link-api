class Api::V1::UsersController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user_from_token!, only: [:index, :show, :create]
  skip_before_filter :authenticate_user!, only: [:index, :show, :create]
  before_filter :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    respond_with @users
  end

  def show
    respond_with @user
  end

  def create
    @user = User.create(user_params)
    respond_with @user, location: url_for([:api, :v1, @user])
  end

  def update
    binding.pry
    @user.update_attributes(user_params)
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
        :username,
        :password,
        :email,
        :admin_id
    )
  end

end