class ApplicationController < ActionController::Base
  include SessionsHelper

  def login_confirmation
    if !(logged_in?)
      redirect_to '/login'
    end
  end

end
