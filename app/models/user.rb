class User < ApplicationRecord
  before_save :add_hauler_to_user
  belongs_to :hauler, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :birth_date, presence: true
  validates :birth_date, format: { with: /\A\d{2}\/\d{2}\/\d{4}\z/ }
  
  def add_hauler_to_user
    hauler = Hauler.find_by!(email_domain: self.email.split('@').last)
    self.hauler = hauler
  end
end
