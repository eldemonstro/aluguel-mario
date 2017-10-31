# == Schema Information
#
# Table name: proposals
#
#  id                 :integer          not null, primary key
#  user_name          :string
#  email              :string
#  start_date         :date
#  end_date           :date
#  total_guests       :integer
#  purpose            :text
#  total_amount       :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  property_id        :integer
#  accept_usage_rules :boolean
#  status             :string           default("waiting")
#

FactoryBot.define do
  factory :proposal do
    start_date '20/12/2018'
    end_date '25/12/2018'
    total_guests 5
    purpose 'alugar uma casa bonita'
    total_amount 1200.00
    property
    accept_usage_rules true
    status 'waiting'
    user
  end
end
