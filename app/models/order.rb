class Order < ApplicationRecord
  before_validation :generate_code
  belongs_to :hauler

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
