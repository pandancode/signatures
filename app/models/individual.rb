class Individual < ApplicationRecord
  has_many :signatories
  has_many :contracts,  through: :signatories
  has_many :addresses

  validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true
  validates :phone_number, presence: true
  #length 10 to 11 numbers for phone number
  validates :phone_number, length: { minimum: 10 }
  validates :phone_number, length: { maximum: 11 }
  #only number for phone number  
  validates :phone_number, numericality: { only_integer: true }
  
end
