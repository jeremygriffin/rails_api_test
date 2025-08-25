require 'rails_helper'

RSpec.describe "Containers", type: :request do
  describe "GET /show" do
    it "returns http success and container details with total weight" do
      container = Container.create!(name: "Test Container")
      Item.create!(name: "Item 1", weight: 10, container: container)
      Item.create!(name: "Item 2", weight: 20, container: container)

      get "/containers/#{container.id}"
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response["id"]).to eq(container.id)
      expect(json_response["name"]).to eq("Test Container")
      expect(json_response["total_weight"]).to eq(30)
    end
  end

  describe "GET /items" do
    it "returns http success and items with current status" do
      container = Container.create!(name: "Test Container")
      item = Item.create!(name: "Test Item", weight: 10, container: container)
      ItemStatus.create!(item: item, status: "created", timestamp: 1.day.ago)
      ItemStatus.create!(item: item, status: "in_transit", timestamp: 1.hour.ago)
      ItemStatus.create!(item: item, status: "delivered", timestamp: Time.now)

      get "/containers/#{container.id}/items"
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response.first["current_status"]).to eq("delivered")
    end
  end
end
