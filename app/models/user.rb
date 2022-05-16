class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :birth_date, presence: true
  validates :birth_date, format: { with: /\A\d{2}\/\d{2}\/\d{4}\z/ }
end
