class ReservationsController < ApplicationController

  before_action :ensure_logged_in, only: [:create]
  before_action :load_restaurant
  # before_action :delete, only: [:destroy]

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to restaurants_url, notice: "Thank you for your reservation!"
    else
      render 'restaurants/show'
    end
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to user_path(@reservation), notice: "Your reservation has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to user_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:number_of_guests, :reservation_time, :email)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # def destroy
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.destroy
  # end

  # def delete
  #   Reservation.destroy_all
  # end
end
