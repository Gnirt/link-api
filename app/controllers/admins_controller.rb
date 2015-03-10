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
    @admin = current_admin
    @users = current_admin.users || []
  end

  def add_student
    admin = Admin.find(params[:teacher_id])
    admin.users << User.find(params[:user_id])
    if admin.save
      flash[:notice] = "You have successfully added a pupil."
    else
      flash[:error] = admin.errors.full_messages
    end
    redirect_to manage_path
  end
end
