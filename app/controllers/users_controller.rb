class UsersController < ApplicationController
  def show
    @user = User.where(:username => params[:username]).first unless params[:username].blank?
    @user = User.find(params[:id]) unless params[:id].blank?
  end
end
