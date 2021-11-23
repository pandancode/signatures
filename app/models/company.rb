class Company < ApplicationRecord
  has_many :contracts
  belongs_to :user

  validates :company_name, presence: true
  validates :address, presence: true
  validates :detail, presence: true
end
