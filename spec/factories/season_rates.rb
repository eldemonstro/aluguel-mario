# == Schema Information
#
# Table name: season_rates
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :date
#  end_date    :date
#  daily_rate  :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  property_id :integer
#

FactoryBot.define do
  factory :season_rate do
    name 'Alta temporada'
    start_date '01/12/2017'
    end_date '25/12/2017'
    daily_rate 800
    property
  end
end
