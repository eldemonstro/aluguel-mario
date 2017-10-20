# == Schema Information
#
# Table name: unavailable_dates
#
#  id         :integer          not null, primary key
#  name       :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UnavailableDate < ApplicationRecord
end
