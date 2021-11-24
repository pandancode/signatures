class User < ApplicationRecord
  ROLES = ["Individual", "Company"].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :company
  has_one :individual

  validates :role, inclusion: { in: ROLES }
  validates :role, presence: true
  validates :email, presence: true, format: Devise.email_regexp
  validates :password, length: { in: 6..12 }
  validates :password, presence: true
end
