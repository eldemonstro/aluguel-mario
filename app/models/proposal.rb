# == Schema Information
#
# Table name: proposals
#
#  id           :integer          not null, primary key
#  user_name    :string
#  email        :string
#  start_date   :string
#  end_date     :string
#  total_guests :integer
#  purpose      :text
#  total_amount :decimal(, )
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  property_id  :integer
#

class Proposal < ApplicationRecord
  belongs_to :property
end
