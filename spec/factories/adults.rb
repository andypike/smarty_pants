FactoryGirl.define do
  factory :adult do
    first_name "Andy"
    last_name "Pike"
    email "me@here.com"

    trait :with_credentials do
      after(:create) do |adult|
        create(:credential, :username => adult.email, :owner => adult)
      end
    end
  end
end
