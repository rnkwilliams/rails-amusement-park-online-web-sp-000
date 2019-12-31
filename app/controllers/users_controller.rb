class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    user = User.create(user_params)
    if user.valid?
      redirect_to user_path(user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
  end
  
  private 
  
  def user_params
    params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
  end
end
