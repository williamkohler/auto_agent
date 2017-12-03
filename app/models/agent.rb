class Agent < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  validates :hubspot_id, presence: true, uniqueness: true
  default_scope -> { order(name: :asc) }

end
