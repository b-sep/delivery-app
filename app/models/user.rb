class User < ApplicationRecord
  before_validation :add_hauler_to_user
  belongs_to :hauler
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :birth_date, presence: true
  validates :birth_date, format: { with: /\A\d{2}\/\d{2}\/\d{4}\z/ }

  private

  def add_hauler_to_user
    user_email =  self.email.split('@').last

    if Hauler.where(email_domain: user_email).any?
      self.hauler = Hauler.where(email_domain: user_email).last
    else
      errors.add(:hauler, 'não encontrada')
    end
  end
end
