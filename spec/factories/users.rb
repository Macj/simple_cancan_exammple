require 'faker'
# This will guess the User class
FactoryGirl.define do
  factory :user do
    name { Faker::Name.first_name } 
    email { Faker::Internet.email }
    password "password"
    password_confirmation "password"

    trait :admin do
      role "admin"
    end    

    trait :writer do
      role "writer"
    end    

    trait :staff do
      role "staff"
    end    

  end
end