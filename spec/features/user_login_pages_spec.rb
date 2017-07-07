require 'rails_helper'

describe "sign up, sign out and sign in" do
  it "will sign up user up" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it 'will sign in a user' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
  end

  it 'will sign out a user' do
    user = FactoryGirl.create(:admin_user)
    login_as(user, :scope => :user)
    logout(:admin_user)
    login_as(user, :scope => :user)
  end
end
