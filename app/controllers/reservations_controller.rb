class ReservationsController < ApplicationController

  before_action :load_restaurant

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)

    if @reservation.save

      redirect_to , notice: "Thank you for your reservation!"
    else
      render :new
    end
  end



  private

  def reservation_params
    params.require(:reservation).permit(:number_of_guests, :reservation_time, :email)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
