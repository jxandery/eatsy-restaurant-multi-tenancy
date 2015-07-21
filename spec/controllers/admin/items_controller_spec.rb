require 'rails_helper'

RSpec.describe Admin::ItemsController, :type => :controller do

  let!(:user) do
    User.create!(:full_name   => "john doe",
                 :email        => "john_doe@example.com",
                 :display_name => "john_doe_123",
                 :role         => "admin",
                 :password     => 'password')
  end

  before(:each) do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  let(:valid_attributes) do
    {
      title: "tacos",
      description: "mexican food",
      price_pie: "",
      picture: "",
      retire: ""
    }
  end

  let(:invalid_attributes) do
    {
      title: "",
      description: ""
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
    describe "with valid attributes" do
      it "creates a new Item" do
        expect {
          post :create, {:item => valid_attributes}, valid_session
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created order as @item" do
        post :create, {:item => valid_attributes}, valid_session
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it "redirects to the created item" do
        post :create, {:item => valid_attributes}, valid_session
        expect(response).to redirect_to(admin_item_path(Item.last))
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { title: "burritos", description: "tex-mex food"}
      }

      it "updates the requested item" do
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item => new_attributes}, valid_session
        item.reload
      end

      it "assigns the requested item as @item" do
        item = Item.create! valid_attributes
        put :update, {:id => item.to_param, :item=> valid_attributes}, valid_session
        expect(assigns(:item)).to eq(item)
      end
    end
  end

  it "redirects to the created item" do
    post :create, {:item => invalid_attributes}, valid_session
    expect(response).to render_template(:new)
  end
end
