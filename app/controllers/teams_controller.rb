class TeamsController < ApplicationController
  
  def new
    @invited_guest = User.new
    @user = User.find(params[:user_id])
  end

  def create
    @invited_guest = User.new(invited_guest_params)

  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  def update
  end

private
  
  def invited_guest_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end