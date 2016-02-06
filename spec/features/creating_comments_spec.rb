require 'rails_helper'

RSpec.feature 'users can create comments' do
  let(:post) { FactoryGirl.create(:post) }
  scenario 'with valid attributes' do
    visit post_path(post)

    fill_in 'Name', with:'Warren'
    fill_in 'Text', with:'I added a comment!'
    click_button 'Create Comment'

    expect(page).to have_content 'Comment has been created'
      within ("#comments" ) do
        expect(page).to have_content 'I added a comment!'
      end
  end
  scenario 'with invalid attributes' do
    visit post_path(post)

    click_button 'Create Comment'

    expect(page).to have_content 'Comment has not been created'
  end
end
