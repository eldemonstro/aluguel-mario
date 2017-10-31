# == Schema Information
#
# Table name: property_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :property_type do
    name 'Apartamento na praia'
  end
end
