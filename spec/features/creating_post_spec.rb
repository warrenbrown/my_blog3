require 'rails_helper'

RSpec.feature 'Users can create post' do
  before do
    visit '/'
    click_link 'New Post'
  end
  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Working Out'
    fill_in 'Content', with: 'Day one'
    click_button 'Create Post'

    expect(page).to have_content 'Post has been created.'
    expect(page).to have_content 'Working Out'
  end

  scenario 'with inclid attributes' do
    fill_in 'Title', with: ''
    fill_in 'Content', with: ''
    click_button 'Create Post'

    expect(page).to have_content 'Post has not been created.'
    expect(page).to have_content "Title can't be blank"
  end

  scenario "with an attachment" do
    fill_in "Title", with: "Add documentation for blink tag"
    fill_in "Content", with: "The blink tag has a speed attribute"
    attach_file "File", "spec/fixtures/speed.txt"
    click_button "Create Post"
    expect(page).to have_content "Post has been created."
    within("#post .attachment") do
      expect(page).to have_content "speed.txt"
    end
  end
end
