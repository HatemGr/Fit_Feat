FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email+#{n}@thp.com" }
    password { 'password' }
    first_name { 'surname' }
    last_name { 'name' }
  end
end
