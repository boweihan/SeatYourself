class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      @restaurants = Restaurant.all.order("created_at DESC")
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    @reservation = @restaurant.reservations.build
  end
end
