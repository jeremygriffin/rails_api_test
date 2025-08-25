require 'rails_helper'

RSpec.describe "Containers", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/containers/1"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /items" do
    it "returns http success and items with current status" do
      item = Item.create!(name: "Test Item", weight: 10, container: 1)
      ItemStatus.create!(item: item, status: "created", timestamp: 1.day.ago)
      ItemStatus.create!(item: item, status: "in_transit", timestamp: 1.hour.ago)
      ItemStatus.create!(item: item, status: "delivered", timestamp: Time.now)

      get "/containers/#{item.container}/items"
      expect(response).to have_http_status(:success)
      json_response = JSON.parse(response.body)
      expect(json_response.first["current_status"]).to eq("delivered")
    end
  end
end
