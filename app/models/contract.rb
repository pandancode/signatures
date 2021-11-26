class Contract < ApplicationRecord
  belongs_to :company
  belongs_to :individual
  has_one_attached :document

  validates :status, inclusion: { in: %w[unopened opened signed] }
  # validates :status, presence: true
  validates :name, presence: true
  validates :description, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
                  against: [ :name, :description ],
                  using: {
                    tsearch: { prefix: true }
                  }
end
