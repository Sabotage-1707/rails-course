FactoryBot.define do
  factory :order do
    association :user
    association :seller
  end
end
