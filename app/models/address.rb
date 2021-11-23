class Address < ApplicationRecord
  belongs_to :individual

  validates :address, presence: true
  validates :active, inclusion: [true, false], allow_nil: false
  validates :active, presence: true
  validates :start_date, presence: true
end
