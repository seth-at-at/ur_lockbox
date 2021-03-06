class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Successfully Logged In"
      redirect_to root_path
    else
      flash[:notice] = "Please Check your Email / Password"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

end
