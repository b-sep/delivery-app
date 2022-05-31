class OrderHistoric < ApplicationRecord
  belongs_to :order
  validates :address, presence: true
end
