require 'rails_helper'

RSpec.describe Item, type: :model do
  it "has a weight and container" do
    container = Container.create!(name: "Test Container")
    item = Item.new(weight: 10, container: container)
    expect(item.weight).to eq(10)
    expect(item.container).to eq(container)
  end

  it { should have_many(:item_statuses) }
end
