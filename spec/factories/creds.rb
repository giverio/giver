# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cred do
    org
    user
    status "moderator"
  end
end
