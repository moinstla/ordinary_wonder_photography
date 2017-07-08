require 'rails_helper'

describe "add review" do
  it 'it navigates to the add review path' do
    user = FactoryGirl.create :user
    login_as user, :scope => :user
    photo = FactoryGirl.create :photo
    visit new_photo_review_path(photo)
    fill_in 'review_content', with: 'I like it'
    click_button 'Create Review'
    expect(page).to have_content 'I like it'
  end

  it 'will add have an error when creating photo with improper attributes' do
    user = FactoryGirl.create :user
    login_as user, :scope => :user
    photo = FactoryGirl.create :photo
    visit new_photo_review_path(photo)
    fill_in 'review_content', with: ''
    click_button 'Create Review'
    expect(page).to have_content 'Please fix these errors'
  end
end

describe "delete review" do
  it 'navigates to the delete review path' do
    user = FactoryGirl.create :admin_user
    login_as user, :scope => :user
    photo = FactoryGirl.create :photo
    visit photo_path(photo)
    review = FactoryGirl.create :review
    visit photo_review_path(photo)
    click_link 'Delete Review'
    expect(page).to have_no_content 'I like it'
  end
end
