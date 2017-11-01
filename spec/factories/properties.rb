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
