class Contract < ApplicationRecord
  belongs_to :company
  has_many :signatories
end
