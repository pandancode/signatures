class Contract < ApplicationRecord
  belongs_to :company
  has_many :signatories
  has_one_attached :photo
end
