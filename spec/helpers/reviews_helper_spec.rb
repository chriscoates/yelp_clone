require 'rails_helper'

# # Specs in this file have access to a helper object that includes
# # the ReviewsHelper. For example:
# #
# describe ReviewsHelper do
# #   describe "string concat" do
# #     it "concats two strings with spaces" do
# #       expect(helper.concat_strings("this","that")).to eq("this that")
# #     end
# #   end
# # end
# RSpec.describe ReviewsHelper, type: :helper do
  def sign_up_test(email: 'test@example.com' )
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
  end



  def leave_review
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in "Thoughts", with: "Amazing!"
    select '5', from: 'Rating'
    click_button 'Leave Review'
  end
#   pending "add some examples to (or delete) #{__FILE__}"
#end
