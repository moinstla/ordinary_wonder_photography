require 'rails_helper'

describe "add photos" do
  it 'navigates to the add photo path' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    visit photos_path
    click_link 'Add Photo'
    fill_in 'photo_name', with: "Photo"
    fill_in 'photo_description', with: "Pretty"
    fill_in 'photo_price', with: "32"
    click_button 'Create Photo'
    expect(page).to have_content 'Photos'
  end

  it 'will add have an error when creating photo with improper attributes' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    visit photos_path
    click_link 'Add Photo'
    fill_in 'photo_name', with: "Photo"
    fill_in 'photo_description', with: "Pretty"
    fill_in 'photo_price', with: ""
    click_button 'Create Photo'
      expect(page).to have_content 'Please fix these errors'
    end
end

describe 'view an individual photo' do
  it 'navigates to the photo path' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    photo = FactoryGirl.create(:photo)
    visit photos_path
    click_link 'Test Photo'
    expect(page).to have_content 'Pretty'
  end
end

describe 'editing a photo' do
  it 'navigates to the photo edit page' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    photo = FactoryGirl.create(:photo)
    visit edit_photo_path(photo)
    fill_in 'photo_name', :with => 'Test Picture'
    click_button 'Update Photo'
    expect(page).to have_content 'Picture'
  end

  it 'will add have an error when updating photo with improper attributes' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    photo = FactoryGirl.create(:photo)
    visit edit_photo_path(photo)
    fill_in 'photo_name', :with => ''
    click_button 'Update Photo'
    expect(page).to have_content 'Please fix these errors'
  end
end

describe "delete photo" do
  it 'navigates to the delete photo path' do
    user = FactoryGirl.create :admin_user
    login_as user, :scope => :user
    photo = FactoryGirl.create :photo
    visit photo_path(photo)
    click_link 'Delete Photo'
    expect(page).to have_no_content 'Test Photo'
  end
end
