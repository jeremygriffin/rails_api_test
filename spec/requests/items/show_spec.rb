require 'rails_helper'

RSpec.describe "items#show" do
  subject(:make_request) { get item_path(item), params: params }

  let(:params) { {} }

  describe "basic fetch" do
    let!(:item) { create(:item) }

    it "works, even when canceled" do
      make_request

      expect(response.status).to eq(200), response.body
      item_response = JSON.parse response.body

      expect(item_response["id"]).to eq item.id
      expect(item_response["name"]).to eq item.name
      expect(item_response["weight"]).to eq item.weight
      expect(item_response["container"]).to eq item.container
    end
  end
end
