class Company < ApplicationRecord
  has_many :users
  has_many :contracts

  validates :company_name, presence: true
  validates :address, presence: true
  validates :detail, presence: true
end
