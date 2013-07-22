class SessionsController < ApplicationController
  def new
    @user = User.new()
  end

  def create 
  	@user = login(params[:user][:email], params[:user][:password])
  	if @user 
  		redirect_to user_path(@user)
  	else
      @user = User.new(users_params)
      render 'new'
  	end
  end

  def destroy
  	logout
    flash[:success] = "Logged out, see you later"
  	redirect_to root_url
  end

private 

  def users_params
    params.require(:user).permit(:email, :password)
  end
end
