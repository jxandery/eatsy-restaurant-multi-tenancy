require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  let(:valid_attributes) do
    {
      user_id:          1,
      order_total:      23.21,
      order_type:       "pick-up",
      delivery_address: "yo moms",
      order_status:     "paid"
    }
  end

  let(:valid_session) { {} }

  describe "GET show" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :show, {:id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, {:order => valid_attributes}, valid_session
        }.to change(Order, :count).by(1)
      end

      it "assigns a newly created order as @order" do
        post :create, {:order => valid_attributes}, valid_session
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
      end

      it "redirects to the created order" do
        post :create, {:order => valid_attributes}, valid_session
        expect(response).to redirect_to(Order.last)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { order: "Bacon Pie", user_id: 2, order_total: 12.21,
          order_type: "pick-up", delivery_address: "yo step-momma",
          order_status: "paid"}
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => new_attributes}, valid_session
        order.reload
      end

      it "assigns the requested order as @order" do
        order = Order.create! valid_attributes
        put :update, {:id => order.to_param, :order => valid_attributes}, valid_session
        expect(assigns(:order)).to eq(order)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete :destroy, {:id => order.to_param}, valid_session
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the orders list" do
      order = Order.create! valid_attributes
      delete :destroy, {:id => order.to_param}, valid_session
      expect(response).to redirect_to(admin_orders_url)
    end
  end
end
