require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in while on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up_test
    end




    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    it "should not allow a user to submit multiple reveiws to a restaurant" do
      create_restaurant
      click_link 'Sign out'
      sign_up_test(email:'robin@example.com')
      leave_review
      leave_review
      expect(page).to have_content("has reviewed this restaurant already")
    end
  end
end
