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
end
