require 'rails_helper'

feature 'Visitor see proporties at homepage' do
  scenario 'successfuly' do

    property_type = PropertyType.create(name: 'Sítio na praia')

    property = Property.create(title: 'Sitio legal', area: '300m2',
                    location: 'Juquitiba', description: 'Bem grande',
                    daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                    maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode criança',
                    property_type: property_type)

    property_2 = Property.create(title: 'Sitio chato', area: '70m2',
                    location: 'Osório', description: 'Bem pequeno',
                    daily_rate: 80.55, rooms: 2, minimum_rent_days: 10,
                    maximum_rent_days: 22, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 4, usage_rules: 'Não pode plantas',
                    property_type: property_type)

    visit root_path

    expect(page).to have_css('h2', property.title)
    expect(page).to have_css('h2', property_2.title)


  end
end
