class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies
  has_many :individuals

  validates :role, inclusion: { in: %w[individual company] }
  validates :role, presence: true
  validates :email, presence: true, format: Devise.email_regexp
  validates :password, length: { in: 6..12 }
  validates :password, presence: true
end
