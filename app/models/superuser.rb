class Superuser < ActiveRecord::Base
  has_secure_password
  validates :name, :email, :phone, presence: true
  has_many :restaurants
end
