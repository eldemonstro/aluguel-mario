FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "pessoa#{n}@bolas.com" }
    password '12345678'
    name 'Luis'
    document '12345678909'
  end
end
