class Hauler < ApplicationRecord
  has_many :vehicles
  has_many :users
  has_many :prices
  has_many :delivery_dates
  has_many :orders
  validates :corporate_name, :brand_name, :address, :email_domain, :registration_number, presence: true
  validates :registration_number, length: { is: 14 }
  validates :corporate_name, :brand_name, :address, :email_domain, :registration_number, uniqueness: true
  enum status: { inactive: 0, active: 5 }
end