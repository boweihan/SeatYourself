class UsersController < ApplicationController
  # before_action :ensure_logged_in, only: [:create]

  def index
   @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      current_user
      redirect_to restaurants_url, notice: "Signed up!"
    else
      render :new
    end
  end



  def show
    @user = User.find(params[:id])
    @reservations = Reservation.where(params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
