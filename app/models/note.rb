class Note < ApplicationRecord
  belongs_to :user
  validates :contents, length: { maximum: 255 }, presence: true
end
