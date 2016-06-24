class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validate :is_full, :on_the_hour,:valid_date

  def valid_guest
    if number_of_guests
      if number_of_guests <= 0
        return false
      else
        return true
      end
    else
      return false
    end
  end


  def is_full
    if valid_guest
      taken_spots = Reservation.where("restaurant_id = ?", self.restaurant_id).where("reservation_time = ?", self.reservation_time).sum(:number_of_guests)
      if (Restaurant.find(self.restaurant_id).max_occupancy - (taken_spots +
        self.number_of_guests)) < 0
        errors.add(:reservation_time, "is unavaivalable. Restaurant full.")
      end
    else
      errors.add(:number_of_guests, "must be filled")
    end
  end

  def on_the_hour
    hour = self.reservation_time.hour
    minute = self.reservation_time.min
    if hour < 8 || hour >  21 || minute != 0
      errors.add(:reservation_time, "can only be between 9 am and 8 pm, at the start of every hour")
    end
  end

  def valid_date
    current = DateTime.now
    current += 1.0/12
    reservation_datetime = self.reservation_time
    unless reservation_time >= current
      errors.add(:reservation_time, "is invalid. Must reserve 2 hours before reservation time")
    end
  end
end
