require 'rails_helper'

RSpec.feature 'Users can view post' do
  scenario 'with post details' do
    post = FactoryGirl.create(:post, title: 'My First')

    visit '/'
    click_link 'My First'

    expect(page.current_url).to eq post_url(post)
  end
end
