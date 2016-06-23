class Reservation < ActiveRecord::Base
  belongs_to :restaurant

  validates :number_of_guests, :email, presence: true
  validates :number_of_guests, numericality: {greater_than: 0}

  validate :is_full, :on_the_hour, :valid_date

  def is_full
    taken_spots = Reservation.where("restaurant_id = ?", self.restaurant_id).where("reservation_time = ?", self.reservation_time).sum(:number_of_guests)

    if (Restaurant.find(self.restaurant_id).max_occupancy - (taken_spots +
      self.number_of_guests)) < 0
      errors.add(:reservation_time, "is unavaivalable. Restaurant full.")
    end
  end

  def on_the_hour
    hour = self.reservation_time.hour
    min = self.reservation_time.min
    if hour < 8 || hour >  21 || min != 0
      errors.add(:reservation_time, "can only be between 9 am and 8 pm")
    end
  end

  def valid_date
    current = Time.now
    reservation_datetime = self.reservation_time
    puts current
    unless ((reservation_datetime.year > current.year) || (reservation_datetime.year == current.year && reservation_datetime.month > current.month) || (reservation_datetime.year == current.year && reservation_datetime.month == current.month && reservation_datetime.day > current.day) || (reservation_datetime.year == current.year && reservation_datetime.month == current.month && reservation_datetime.day == current.day && reservation_datetime.hour > 2+current.hour.to_i) || (reservation_datetime.year == current.year && reservation_datetime.month == current.month && reservation_datetime.day == current.day && reservation_datetime.hour == 2+ current.hour.to_i && reservation_datetime.minute >= current.minute))
      errors.add(:reservation_time, "is invalid. Must reserve at least 2 hours before reservation time")
    end
  end
end
