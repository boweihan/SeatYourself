class SessionsController < ApplicationController
  def new
    render :layout => false
  end

  def create
    user = User.find_by(email: params[:email])
    superuser = Superuser.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to restaurants_url, notice: "Thanks for logging in!"
    elsif superuser && superuser.authenticate(params[:password])
      session[:superuser_id] = superuser.id
      redirect_to superusers_url, notice: "Thanks for logging in as superuser!"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_url, notice: "You have logged out."
  end
end
