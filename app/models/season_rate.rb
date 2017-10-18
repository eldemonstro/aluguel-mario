# == Schema Information
#
# Table name: season_rates
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :string
#  end_date    :string
#  daily_rate  :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  property_id :integer
#

class SeasonRate < ApplicationRecord
  belongs_to :property
end
