require 'rails_helper'

feature 'User search for a property by location' do
  scenario 'successfuly' do

    property_type_1 = PropertyType.create(name: 'Apartamento na praia')
    property_type_2 = PropertyType.create(name: 'Sitio para festa')

    property = Property.create(title: 'Sitio legal', area: '300m2',
                    location: 'Juquitiba', description: 'Bem grande',
                    daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                    maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode criança',
                    property_type_id: property_type_2.id)

    property_2 = Property.create(title: 'Apartamento muito bom', area: '30m2',
                    location: 'Praia grande', description: 'Bem pequeno',
                    daily_rate: 80.55, rooms: 1, minimum_rent_days: 1,
                    maximum_rent_days: 30, photo: 'photo_boa.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode cachorro',
                    property_type_id: property_type_1.id)




    visit root_path

    fill_in 'Busca por Localização', with: 'Juquitiba'

    click_on 'Buscar por Localização'

    expect(page).to have_content property.title
    expect(page).to have_content property.property_type.name
    expect(page).to have_content property.location
    expect(page).to have_content property.area
    expect(page).to have_content property.description
    expect(page).to have_content "R$ 800,55"
    expect(page).to have_content property.photo

    expect(page).not_to have_content property_2.title
    expect(page).not_to have_content property_2.property_type.name
    expect(page).not_to have_content property_2.location
    expect(page).not_to have_content property_2.area
    expect(page).not_to have_content property_2.description
    expect(page).not_to have_content "R$ #{property_2.daily_rate}"
    expect(page).not_to have_content property_2.photo
  end
end
