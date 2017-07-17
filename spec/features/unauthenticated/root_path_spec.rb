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

describe "As a registered user" do
  before(:each) do
    User.create(email: "example@example.com", password: "ex1")
  end

  it "shows successful flash message on sign in" do
    visit login_path
    fill_in "email", with: "example@example.com"
    fill_in "password", with: "ex1"

    click_on "Login"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Successfully Logged In")
  end

  it "shows failed flash message on sign in failure" do
    visit login_path
    fill_in "email", with: "example.com"
    fill_in "password", with: "ex1"

    click_on "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Please Check your Email / Password")
  end
end

describe "When I visit root_path as authenticated user" do
  it "Shows link to sign out" do
    user = User.create(email: "example@example.com", password: "ex1")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("Sign Out")
  end
end
