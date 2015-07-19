require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a user can signin and signout', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                 :email        => "john_doe@example.com",
                 :display_name => "john_doe_123",
                 :password     => 'password')
  end

  context "non-admin user signin and signout" do
    it 'can login with the correct information' do
      page.visit signin_path
      page.fill_in('session[email]',    with: user.email)
      page.fill_in('session[password]', with: 'password')
      page.click_button('Sign in')
      expect(page.current_path).to eq(user_path(user))
    end

    it 'can logout' do
      page.visit signin_path
      page.fill_in('session[email]',    with: user.email)
      page.fill_in('session[password]', with: 'password')
      page.click_button('Sign in')
      expect(page.current_path).to eq(user_path(user))

      page.click_link('Sign Out')
      expect(page.current_path).to eq(root_path)
    end
  end
end
