
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

end
