require 'rails_helper'

RSpec.describe "items#update" do
  subject(:make_request) { put item_path(item), params: params }

  let(:params) { {name:} }
  let(:name) { "Chair" }

  let!(:item) { create(:item, name: "Desk") }

  describe "basic create" do
    it "works, even when canceled" do
      expect(item.name).to_not eq name
      expect { make_request }.to change(Item, :count).by(0)

      expect(response.status).to eq(200), response.body
      item_response = JSON.parse response.body

      expect(item_response["name"]).to eq name
      expect(item_response["weight"]).to eq item.weight
      expect(item_response["container"]).to eq item.container
    end
  end
end
