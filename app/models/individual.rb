class Individual < ApplicationRecord
  has_many :signatories
  has_many :contracts, through: :signatories
  has_many :addresses
  has_many :users

  validates :first_name, presence: true
  validates :first_name, numericality: { only_integer: false }

  validates :last_name, numericality: { only_integer: false }
  validates :last_name, presence: true

  validates :birth_date, presence: true

  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10 }
  validates :phone_number, length: { maximum: 11 }
  validates :phone_number, numericality: { only_integer: true }

  validates :title, presence: true
  validates :title, inclusion: { in: %w[Mr Ms] }
  validates :title, numericality: { only_integer: false }
end
