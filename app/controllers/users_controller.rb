class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save && authenticate_password
      session[:user_id] = user.id
      flash[:notice] = "Account Successfully Created"
      redirect_to root_path
    else
      flash[:notice] = "Please Enter Valid #{empty_params}"
      if User.find_by(email: params[:user][:email])
        flash[:notice] = "Email is taken!"
      end
      redirect_to :back
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end

    def empty_params
      user_params.keys.each do |key|
        if user_params[key].length == 0
          return key
        end
      end
      return "Credentials"
    end

    def authenticate_password
      params[:user][:password] == params[:user][:password_confirmation]
    end
end
