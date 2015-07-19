class UsersController < ApplicationController
  before_action :set_user,   only: [:show]
  before_action :authorize?, only: [:show]

  def show
  end

  def new
    @user  = User.new
    @title = "Create an account"
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in @user
      flash[:success] = 'Welcome!'
      redirect_to @user
    else
      render 'new'
    end
  end

  private

  def authorize?
    redirect_to "https://www.youtube.com/watch?v=Jvk7faxsxkQ" unless current_user.id == @user.id
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name,
                                 :email,
                                 :display_name,
                                 :role,
                                 :password,
                                 :password_confirmation
                                 )
  end
end
