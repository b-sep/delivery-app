class DeliveryDate < ApplicationRecord
  belongs_to :hauler
  validates :distance_1, :distance_2, :days, presence: true
  validates :distance_1, :distance_2, :days, numericality: true
end
