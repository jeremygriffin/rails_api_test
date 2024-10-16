require 'rails_helper'

RSpec.describe "items#create" do
  subject(:make_request) { post items_path, params: params }

  let(:params) { {name:, weight:, container_no:} }
  let(:name) { "Chair" }
  let(:weight) { 55 }
  let(:container_no) { 10 }

  describe "basic create" do
    it "works, even when canceled" do
      expect { make_request }.to change(Item, :count).by(1)

      expect(response.status).to eq(200), response.body
      item_response = JSON.parse response.body

      expect(item_response["name"]).to eq name
      expect(item_response["weight"]).to eq weight
      expect(item_response["container_no"]).to eq container_no
    end
  end
end
