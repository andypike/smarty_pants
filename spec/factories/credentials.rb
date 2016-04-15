FactoryGirl.define do
  factory :credential do
    username "me@here.com"
    password "secret123"
    password_confirmation "secret123"
    association :owner, :factory => :adult
  end
end
