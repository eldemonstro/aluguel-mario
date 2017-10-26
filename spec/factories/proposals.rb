FactoryBot.define do
  factory :proposal do
    user_name 'Nicolas'
    email 'nicolas@gmail.com'
    start_date '20/12/2017'
    end_date '20/12/2017'
    total_guests 5
    purpose 'alugar uma casa bonita'
    total_amount 1200.00
    property
    accept_usage_rules true
    status 'waiting'
  end
end
