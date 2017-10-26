FactoryBot.define do
  factory :proposal do
    user_name 'Nicolas'
    sequence(:email) { |n| "user_#{n}@gmail.com"}
    start_date '20/12/2018'
    end_date '25/12/2018'
    total_guests 5
    purpose 'alugar uma casa bonita'
    total_amount 1200.00
    property
    accept_usage_rules true
    status 'waiting'
  end
end
