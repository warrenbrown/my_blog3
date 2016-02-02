require 'rails_helper'

RSpec.feature 'Users can delete post' do
  scenario 'succesfully' do
    FactoryGirl.create(:post, title: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
    click_link "Delete Post"
    
  end
end
