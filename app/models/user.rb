class User < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :phone, presence: true

  has_many :reservations
  has_many :restaurants, through: :reservations

end
