class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :number_of_guests, :email, presence: true
  validate :reservation_time_passes

  def reservation_time_passes
    taken_spots = Reservation.where("restaurant_id = ?", self.restaurant_id).where("reservation_time = ?", self.reservation_time).sum(number_of_guests)

    if (Restaurant.find(self.restaurant_id).max_occupancy - (taken_spots +
      self.number_of_guests)) < 0
      errors.add(:reservation_time, "this time is invalid") unless
        false
    else
        true
    end

  end

end
