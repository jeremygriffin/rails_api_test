class Container < ApplicationRecord
  has_many :container_histories
  has_many :items
  validates :name, presence: true
end
