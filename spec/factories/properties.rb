# == Schema Information
#
# Table name: properties
#
#  id                 :integer          not null, primary key
#  location           :string
#  area               :string
#  title              :string
#  description        :text
#  daily_rate         :decimal(, )
#  rooms              :integer
#  minimum_rent_days  :integer
#  maximum_rent_days  :integer
#  maximum_occupancy  :integer
#  usage_rules        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  property_type_id   :integer
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

FactoryBot.define do
  factory :property do
    location 'Guarujá'
    title 'Apartamento na praia'
    area '30 m2'
    description 'Cabe 30 pessoas'
    daily_rate 600
    rooms 3
    minimum_rent_days 1
    maximum_rent_days 30
    maximum_occupancy 30
    usage_rules 'Não pode cavalo'
    photo { File.new("#{Rails.root}/spec/support/fixtures/image.jpg") }
    property_type
    owner
  end
end
