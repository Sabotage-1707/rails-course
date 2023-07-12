FactoryBot.define do
  factory :item do
    price {Faker::Number.decimal(l_digits: 4, r_digits: 2)}
    name { Faker::Lorem.word.downcase}
    real {Faker::Boolean.boolean}
    weight {Faker::Number.between(from: 1, to: 10)}
    description {Faker::Lorem.sentence(word_count: 3) }
    votes  {Faker::Number.between(from: 1, to: 10)}
    association :seller
  end
end
