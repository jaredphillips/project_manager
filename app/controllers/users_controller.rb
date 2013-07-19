class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      auto_login(@user)
  		redirect_to @user, notice: "Signed up!"
  	else
  		render :new
  	end
  end

  def show 
    @user = User.find(params[:id])
    @projects = Project.where(user_id: @user)  
  end

private

	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password)
  end 
end
