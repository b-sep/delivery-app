class Hauler < ApplicationRecord
  validates :corporate_name, :brand_name, :address, :email_domain, :registration_number, presence: true
  validates :registration_number, length: { is: 14 }
end
