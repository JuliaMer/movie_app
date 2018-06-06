class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_screen_name(params[:session][:screen_name])
    hashed_password = Digest::SHA256.hexdigest params[:session][:password]

    if (!user.nil?)
      if (user.password == hashed_password)
        log_in(user)
        redirect_to user_path(user)
      else
        flash[:fail] = "Invalid username/password combination"
        render 'new'
      end
    else
      flash[:fail] = "Invalid username/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/home'
  end
end
