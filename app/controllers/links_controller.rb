class LinksController < ApplicationController
  def index
    if current_user
      @current_user = current_user
    else
      redirect_to login_signup_path
    end
  end
end
