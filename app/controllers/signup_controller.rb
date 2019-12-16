class SignupController < ApplicationController

  def new
  end

  def user_registration1
    @user = User.new
  end

  def done
    sign_in User.find(session[:id]) unless user_signed_in?
    redirect_to new_user_card_path(session[:id])
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to done_signup_index_path
    else
      render '/signup/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
