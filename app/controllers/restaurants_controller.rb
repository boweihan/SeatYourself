class RestaurantsController < ApplicationController
  before_action :ensure_superuser_logged_in, only: [:new, :create]

  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      @restaurants = Restaurant.all.order("created_at DESC")
    end
  end

  def new
    @restaurant = Restaurant.new(params[:id])
    render :layout => false
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.superuser_id = current_superuser.id

    if @restaurant.save
      redirect_to superusers_url, notice: "you have created a new restaurant"
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    @reservation = @restaurant.reservations.build
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :max_occupancy, :address, :website, :cuisine)
  end

end
