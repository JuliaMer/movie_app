class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "You added a new user to the database!"
      redirect_to user_path(@user)
    else
      render 'users/new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You updated your profile"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def index
  end

  private

  def user_params
    params.require(:user).permit(:screen_name, :email, :password)
  end
end
