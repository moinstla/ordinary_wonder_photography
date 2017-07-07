require 'rails_helper'

describe Photo do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should have_many :reviews }
end