require 'rails_helper'

describe "add photos" do
  it 'will add a photo' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    visit photos_path(user)
    click_link 'Add a New Photo'
    fill_in 'photo_name', with: "Photo"
    fill_in 'photo_description', with: "Pretty"
    fill_in 'photo_price', with: "32"
    click_button 'Create Photo'
    expect(page).to have_content 'All Photos'
  end
end
