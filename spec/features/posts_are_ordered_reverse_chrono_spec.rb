require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
    scenario "Posts are in reverse chronologcal order" do
        user = FactoryBot.create(:user)
        login_as(user, :scope => :user)
        visit "/"

        click_link "New post"
        fill_in "Message", with: "1111"
        click_button "Submit"
        
        click_link "New post"
        fill_in "Message", with: "2222"
        click_button "Submit"
        
        posts = page.all('.post')
        
        expect(posts[0]).to have_content("2222")
    end
end
