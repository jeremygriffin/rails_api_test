class Item < ApplicationRecord
  has_many :item_statuses
  belongs_to :container
end
