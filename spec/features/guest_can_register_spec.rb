require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'a guest can create account', type: :feature do
  it 'user can register account' do
    page.visit signup_path
    page.fill_in('Full name',    with: 'john doe')
    page.fill_in('Email', with: "john_doe@example.com")
    page.fill_in('Display name',    with: "john_doe_123")
    page.fill_in('Password', with: 'password')
    page.fill_in('Confirmation', with: 'password')
    page.click_button('Create Account')
    expect(page.current_path).to eq(user_path(User.last))
    expect(page).to have_content('Welcome!')
  end
end
