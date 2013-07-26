class UsersController < ApplicationController
  before_filter :require_login, only: [:show]

  def index
  end
  
  def new
  	@user = User.new()
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      auto_login(@user)
  		redirect_to user_path(@user)
  	else
  		render :new
  	end
  end

  def show 
    @user = User.find(params[:id])
    @projects = Project.where(user_id: @user)  
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path
    else
      redirect_back_or_to user_path
    end
  end

private

	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :scale, :invitation_token)
  end 
end
