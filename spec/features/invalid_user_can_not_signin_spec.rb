require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'an invalid user cannot signin', type: :feature do
  let(:user) do
    User.create!(:full_name   => "john doe",
                 :email        => "john_doe@example.com",
                 :display_name => "john_doe_123",
                 :password     => 'password')
  end

  it 'user cannot login without the correct information' do
    page.visit signin_path
    page.fill_in('session[email]',    with: 'jimbo@example.com')
    page.fill_in('session[password]', with: 'password')
    page.click_button('Sign in')
    expect(page).to have_content('Sign In:')
    expect(page).to have_content('Invalid email/password combination')
  end
end
