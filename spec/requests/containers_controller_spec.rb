require 'rails_helper'

RSpec.describe "Containers", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/containers/1"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /items" do
    it "returns http success" do
      get "/containers/1/items"
      expect(response).to have_http_status(:success)
    end
  end
end
