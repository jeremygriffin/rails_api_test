require 'rails_helper'

RSpec.describe "items#index" do
  subject(:make_request) { get items_path }

  describe "basic fetch" do
    let!(:item) { create(:item) }
    let!(:item2) { create(:item) }
    let!(:item3) { create(:item) }
    let!(:item4) { create(:item) }

    it "works, even when canceled" do
      make_request

      items_to_match = [item,item2,item3,item4]
      expect(response.status).to eq(200), response.body
      items_response = JSON.parse response.body
      expect(items_response.count).to eq items_to_match.count
      expect(items_response.pluck("id")). to match items_to_match.pluck(:id)
    end
  end
end
