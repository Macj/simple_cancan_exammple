require 'faker'
# This will guess the User class
FactoryGirl.define do
  factory :card do
    title { Faker::Name.title } 
  end
end