class UsersController < ApplicationController
  before_filter :require_login, only: [:show]

  def index
  end
  
  def new
    @token = params[:invitation_token]
  	@user = User.new()
  end

  def create
    @invitation = Invitation.where(token: params[:invitation_token]).first
    @user = User.new(user_params)
  	if @user.save
      if @invitation.present?
        ProjectMember.find(project_id: @invitation.project_id, user_id: @user.id)
      end
      auto_login(@user)
  		redirect_to user_path(@user)
  	else
  		render new_user_path
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
	  params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar, :scale)
  end 
end
