class ContainerHistory < ApplicationRecord
  belongs_to :container
  validates :name, presence: true
  validates :timestamp, presence: true
end
