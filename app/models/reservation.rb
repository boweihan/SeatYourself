class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :number_of_guests, :email, presence: true
  validate :reservation_time_passes

  def reservation_time_passes
    taken_spots = Reservation.where("reservation_time = reservation_time").count


    if (Restaurant.find(self.restaurant_id).max_occupancy - (taken_spots +
      self.number_of_guests)) < 0
      errors.add(:reservation_time, "this time is invalid") unless
        false
    else
      errors.add(:reservation_time, "this time is invalid") unless
        true
    end

  end

end
