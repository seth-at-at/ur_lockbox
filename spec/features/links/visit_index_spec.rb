require 'rails_helper'

describe 'When I visit root', type: :feature, js: true do
  before(:each) do
    @user = User.create(email: "a", password: "a")
    @user.links.create(url: "https://www.facebook.com", title: "Facebook")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "creates link when filled in correctly" do
    visit root_path

    fill_in "url_input", with: "https://google.com"
    fill_in "title_input", with: "Google"
    click_on "Add Link"

    within("#all_links") do
      expect(page).to have_content("Google")
    end

    within("#all_links") do
      click_on "Mark as Read"
      expect(page).to have_content("Mark as Unread")
    end

    visit root_path

    within("#all_links") do
      click_on "Mark as Unread"
      expect(page).to have_content("Mark as Read")
    end
  end
end
