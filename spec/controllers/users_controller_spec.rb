
require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:valid_attributes) do
    {
      :full_name   => "john doe",
      :email        => "john_doe@example.com",
      :display_name => "john_doe_123",
      :password     => 'password'
    }
  end

  let(:invalid_attributes) do
    {
      :full_name   => "",
      :email        => "",
      :display_name => "",
      :password     => ''
    }
  end

  let(:valid_session) { {} }

  describe "GET new" do
    it "users#new" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post :create, {:user => valid_attributes}, valid_session
        }.to change(User, :count).by(1)
      end

      it "assigns a newly created user as @user" do
        post :create, {:user => valid_attributes}, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it "redirects to the created user" do
        post :create, {:user => invalid_attributes}, valid_session
        expect(response).to render_template(:new)
      end
    end

    describe 'invalid params' do
      it "renders to the new" do
        post :create, {:user => valid_attributes}, valid_session
        expect(response).to redirect_to(User.last)
      end
    end
  end

  #describe "PUT update" do
    #describe "with valid params" do
      #let(:new_attributes) {
        #{ order: "Bacon Pie", user_id: 2, order_total: 12.21,
          #order_type: "pick-up", delivery_address: "yo step-momma",
          #order_status: "paid"}
      #}

      #it "updates the requested order" do
        #order = Order.create! valid_attributes
        #put :update, {:id => order.to_param, :order => new_attributes}, valid_session
        #order.reload
      #end

      #it "assigns the requested order as @order" do
        #order = Order.create! valid_attributes
        #put :update, {:id => order.to_param, :order => valid_attributes}, valid_session
        #expect(assigns(:order)).to eq(order)
      #end
    #end
  #end

  #describe "DELETE destroy" do
    #it "destroys the requested order" do
      #order = Order.create! valid_attributes
      #expect {
        #delete :destroy, {:id => order.to_param}, valid_session
      #}.to change(Order, :count).by(-1)
    #end

    #it "redirects to the orders list" do
      #order = Order.create! valid_attributes
      #delete :destroy, {:id => order.to_param}, valid_session
      #expect(response).to redirect_to(admin_orders_url)
    #end
  #end
end
