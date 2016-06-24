class SuperusersController < ApplicationController
  before_action :ensure_superuser_logged_in, only: [:index, :show]

  def index
   @superusers = Superuser.all
   render :layout => false
  end

  def new
    @superuser = Superuser.new
    render :layout => false
  end

  def create
    @superuser = Superuser.new(superuser_params)
    if @superuser.save
      session[:superuser_id] = @superuser.id
      current_superuser
      redirect_to restaurants_url, notice: "Signed up!"
    else
      render :new
    end
  end

  def show
    @superuser = Superuser.find(params[:id])
    @restaurants = Restaurant.where(:superuser_id => @superuser.id)
    render :layout => false
  end


  private
  def superuser_params
    params.require(:superuser).permit(:name, :phone, :email, :password, :password_confirmation)
  end
end
