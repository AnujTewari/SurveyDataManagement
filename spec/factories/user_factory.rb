FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@example.com"
  end
  factory :user do 
  email 
  password "user1234"
  encrypted_password "password"
  admin 1
  end

end
