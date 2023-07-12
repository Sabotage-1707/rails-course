FactoryBot.define do
  factory :user do
    login {Faker::Name.name}
    password {Faker::Music.chord}
  end
end
