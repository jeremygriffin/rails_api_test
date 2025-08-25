class ItemStatus < ApplicationRecord
  belongs_to :item
  validates :status, presence: true
  validates :timestamp, presence: true
end
