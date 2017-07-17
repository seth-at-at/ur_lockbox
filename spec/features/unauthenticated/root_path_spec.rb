require 'rails_helper'

describe "When I visit root as unauthenticated user" do
  it "redirects to login_path" do
    visit root_path
    expect(current_path).to eq(login_path)
    
    click_on "Sign Up by clicking here"
    expect(current_path).to eq(signup_path)
  end

  it "prompts to login or signup" do
    visit signup_path

    fill_in "user[email]", with: "seth@seth.com"
    fill_in "user[password]", with: "seth1"
    fill_in "user[password_confirmation]", with: "seth1"

    click_on "Create Account"

    expect(current_path).to eq(root_path)
  end
end
