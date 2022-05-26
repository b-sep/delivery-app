class Order < ApplicationRecord
  before_validation :cubic_meter
  before_validation :generate_code
  belongs_to :hauler


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
