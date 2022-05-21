class Admin < ApplicationRecord
  before_validation :ensure_is_admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def ensure_is_admin
    admin_domain = 'deliveryapp.com'
    input_domain = self.email.split('@').last

    unless input_domain == admin_domain
      errors.add(:admin, 'inválido')
    end
  end
end
