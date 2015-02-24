class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admins = Admin.all
  end

  def show
    @admin = current_admin
  end

  def new
    @admin = current_admin
  end

  def update
    @admin = current_admin
  end

  def edit
    @admin = current_admin
  end

  def manage
    @users = current_admin.users || []
  end
end
