class Order < ApplicationRecord
  before_create :cubic_meter
  before_create :generate_code
  belongs_to :hauler

  validates :heigth, :depth, :width, :distance, :weight, :price, :days, :user, :address, presence: true
  validates :heigth, :depth, :width, :distance, :weight, :price, numericality: true


  enum status: {pending: 0, accepted: 5, recused: 10}, _default: :pending

  def cubic_meter
    (self.heigth.to_f * self.depth * self.width) / 1_000_000
  end

  private

  def generate_code
    code = self.code
    if code.nil?
      self.code = SecureRandom.alphanumeric(10).upcase
    else
      code
    end
  end

end
