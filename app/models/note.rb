class Note < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 140 }

  scope :published, -> { where(published: true) }
end
