class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, through: :reservations
  belongs_to :superuser

  validates :name, :address, :website, :cuisine, presence: true
  validates :max_occupancy, :numericality => { :greater_than => 0 }

  def self.search(search)
    where("name LIKE ? OR address LIKE ? OR website LIKE ? OR cuisine LIKE?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
