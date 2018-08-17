class SessionsController < ApplicationController
 skip_before_action :require_login, only: [:new, :create, :facebook]
  
  def destroy
    session.clear
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Log In failed, please try again."
      redirect_to login_path
  end


end

def facebook
  if auth = request.env["omniauth.auth"]
    @user = User.find_or_create_by_omniauth(auth)
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  
    else
      render :new
    
  end
end

private

 def auth
   request.env['omniauth.auth']
 end

end
