FactoryBot.define do
  factory :owner do
    name 'Christian'
    document '11122233345'
    sequence(:email) { |n| "teste#{n}@teste.com"}
    password '123456'
  end
end
