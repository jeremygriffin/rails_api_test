require 'rails_helper'

RSpec.describe ItemStatus, type: :model do
  it { should belong_to(:item) }
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:timestamp) }
end