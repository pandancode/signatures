class Individual < ApplicationRecord
  has_many :contracts
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true

  validates :phone_number, presence: true
  validates :phone_number, length: { minimum: 10 }
  validates :phone_number, length: { maximum: 11 }
  validates :phone_number, numericality: { only_integer: true }

  validates :title, presence: true
  validates :title, inclusion: { in: %w[Mr Ms Mx] }

  has_one_attached :signature

  def full_name
    "#{first_name} #{last_name}"
  end
end
