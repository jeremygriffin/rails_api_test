require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a weight and container_id" do
    item = Item.new(weight: 10, container: 1)
    expect(item.weight).to eq(10)
    expect(item.container).to eq(1)
  end
end
