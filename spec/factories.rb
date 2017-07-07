FactoryGirl.define do
  factory :user do
    admin false
    email'me@me.com'
    password 123456
  end

  factory :admin_user, class: 'User' do
    admin true
    email'admin@admin.com'
    password 123456
  end



  factory :photo, class: Photo do
    name 'Photo'
    description 'Pretty'
    price 50
  end

  factory :review, class: Review do
    content 'I like it'
  end
end
