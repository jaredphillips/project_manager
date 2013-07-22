class SessionsController < ApplicationController
  def new
  end

  def create 
  	user = login(params[:email], params[:password])
  	if user 
  		redirect_to user
  	else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
  	end
  end

  def destroy
  	logout
  	redirect_to root_url, notice: "Logged out"
  end
end
