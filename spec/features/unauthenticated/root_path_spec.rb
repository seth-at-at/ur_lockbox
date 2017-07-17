require 'rails_helper'

describe "When I visit root as unauthenticated user", type: :feature, js: true do
  it "redirects to login_signup_path" do
    visit root_path
    expect(current_path).to eq(login_signup_path)
  end

  it "prompts to login or signup" do
    visit login_signup_path

    expect(page).to have_content("Please Login or Signup!")

    click_on "Signup!"

    fill_in "user[name]", with: "Seth"
    fill_in "user[email]", with: "seth@seth.com"
    fill_in "user[password]", with: "seth1"
    fill_in "user[password_confirmation]", with: "seth1"

    click_on "Create Account"

    expect(current_path).to eq(root_path)
  end
end
