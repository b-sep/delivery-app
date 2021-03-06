class Vehicle < ApplicationRecord
  belongs_to :hauler
  belongs_to :order, optional: true

  validates :license_plate, :full_load, :car_model, :year, :vehicle_brand, presence: true
  validates :license_plate, uniqueness: true
  validates :license_plate, length: { is: 7 }
end
