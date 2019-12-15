class SignupController < ApplicationController

  def new
  end

  def user_registration1
    @user = User.new
  end

  def user_registration2
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to user_registration2_signup_index_path
    else
      render '/signup/new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
