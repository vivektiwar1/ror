class UsersController < ApplicationController
  def new
  	 @user = User.new
  end
  def show
    if session[:user_id]  == nil
        redirect_to login_path
    else
      @user = User.find(session[:user_id])
    end
  end

   def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
