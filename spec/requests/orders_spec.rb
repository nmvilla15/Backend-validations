require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "get orders_path" do
    it "renders the index view" do
      FactoryBot.create_list(:order, 10)
      get orders_path
      expect(response).to render_template(:index)
    end
  end

  describe "get order_path" do
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get order_path(id: order.id)
      expect(response).to render_template(:show)
    end
    it "redirects to the index path if the order id is invalid" do
      get order_path(id: 5000)
      expect(response).to redirect_to orders_path
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/orders/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/orders/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
