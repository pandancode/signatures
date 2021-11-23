class Signatory < ApplicationRecord
  belongs_to :contract

  validates :signing_status, inclusion: [true, false], allow_nil: false
end
