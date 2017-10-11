# == Schema Information
#
# Table name: properties
#
#  id                :integer          not null, primary key
#  location          :string
#  area              :string
#  title             :string
#  description       :text
#  daily_rate        :decimal(, )
#  rooms             :integer
#  minimum_rent_days :integer
#  maximum_rent_days :integer
#  photo             :string
#  maximum_occupancy :integer
#  usage_rules       :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Property < ApplicationRecord
end
