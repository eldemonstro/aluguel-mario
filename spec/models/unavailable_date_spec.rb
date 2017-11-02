# == Schema Information
#
# Table name: unavailable_dates
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  property_id :integer
#

require 'rails_helper'

RSpec.describe UnavailableDate, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
