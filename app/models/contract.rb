class Contract < ApplicationRecord
  belongs_to :company
  belongs_to :individual
  has_one_attached :photo

  validates :status, inclusion: { in: %w[unopened opened signed] }
  # validates :status, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
