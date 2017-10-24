require 'rails_helper'

feature 'Visitor Use Navigation Menu' do
  scenario 'Visit create property' do
    click_on 'Cadastrar Imóvel'

    expect(page).to have_content 'Cadastre um Imóvel'
  end
  scenario 'Search property by location' do
    property_type_1 = PropertyType.create(name: 'Apartamento na praia')

    property = Property.create(title: 'Sitio legal', area: '300m2',
                    location: 'Juquitiba', description: 'Bem grande',
                    daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                    maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode criança',
                    property_type_id: property_type_1.id)

    visit root_path

    fill_in 'Digite aqui uma localização para buscar', with: 'Juquitiba'

    click_on 'Buscar por localização'

    expect(page).to have_content property.title
    expect(page).to have_content property.property_type.name
    expect(page).to have_content property.location
    expect(page).to have_content property.area
    expect(page).to have_content property.description
    expect(page).to have_content "R$ 800,55"
    expect(page).to have_content property.photo
  end
  scenario 'Search Property by name' do
    property_type_1 = PropertyType.create(name: 'Apartamento na praia')

    property = Property.create(title: 'Apartamento muito bom', area: '30m2',
                    location: 'Praia grande', description: 'Bem pequeno',
                    daily_rate: 80.55, rooms: 1, minimum_rent_days: 1,
                    maximum_rent_days: 30, photo: 'photo_boa.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode cachorro',
                    property_type: property_type_1)

    visit root_path

    fill_in 'Buscar por tipo do imóvel', with: 'Apartamento na praia'

    click_on 'Buscar por Tipo'

    expect(page).to have_content property.title
    expect(page).to have_content property.property_type.name
    expect(page).to have_content property.location
    expect(page).to have_content property.area
    expect(page).to have_content property.description
    expect(page).to have_content "R$ 80,55"
    expect(page).to have_content property.photo
  end
end
