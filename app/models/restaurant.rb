class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations

  def self.search(search)
    where("name LIKE ? OR address LIKE ? OR website LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
