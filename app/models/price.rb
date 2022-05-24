class Price < ApplicationRecord
  belongs_to :hauler
  validates :min_cubic_meter, :max_cubic_meter, :min_weight, :max_weight, :km_price, presence: true
  validates :min_cubic_meter, :max_cubic_meter, :min_weight, :max_weight, :km_price, numericality: true
end
