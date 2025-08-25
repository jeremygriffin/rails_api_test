require 'rails_helper'

RSpec.describe ContainerHistory, type: :model do
  it { should belong_to(:container) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:timestamp) }
end
