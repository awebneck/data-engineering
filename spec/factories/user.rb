FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "lschallengeuser#{sprintf '%02d', n}@mailinator.com" }
    password 'password'
    password_confirmation 'password'
  end
end
