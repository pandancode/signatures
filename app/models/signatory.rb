class Signatory < ApplicationRecord
  belongs_to :contract
  belongs_to :individual

  validates :signing_status, inclusion: [true, false], allow_nil: false
end
