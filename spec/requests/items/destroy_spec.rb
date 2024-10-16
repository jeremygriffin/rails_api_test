require 'rails_helper'

RSpec.describe "items#destroy" do
  subject(:make_request) { delete item_path(item) }

  describe "basic fetch" do
    let!(:item) { create(:item) }

    it "works, even when canceled" do
      expect { make_request }.to change(Item, :count).by(-1)

      expect(response.status).to eq(200), response.body
    end
  end
end
