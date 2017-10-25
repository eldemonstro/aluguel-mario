require 'rails_helper'

feature 'Visitor Use Navigation Menu' do
  scenario 'Visit Home' do
    visit new_property_path

    click_on 'Home'

    expect(current_path).to eq(root_path)
  end
  scenario 'Visit create property' do
    visit root_path
    click_on 'Cadastrar Imóvel'

    expect(current_path).to eq(new_property_path)
  end
  scenario 'Search property by location' do
    property_type = PropertyType.create(name: 'Sitio para festa')

    property = Property.create(title: 'Sitio legal', area: '300m2',
                     location: 'Juquitiba', description: 'Bem grande',
                     daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                     maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                     maximum_occupancy: 15, usage_rules: 'Não pode criança',
                     property_type: property_type)

    visit root_path

    fill_in 'Busca por Localização', with: 'Juquitiba'

    click_on 'Buscar por Localização'

    expect(current_path).to eq(search_by_location_properties_path)
  end
  scenario 'Search Property by name' do
    property_type = PropertyType.create(name: 'Sitio para festa')

    property = Property.create(title: 'Sitio legal', area: '300m2',
                     location: 'Juquitiba', description: 'Bem grande',
                     daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                     maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                     maximum_occupancy: 15, usage_rules: 'Não pode criança',
                     property_type: property_type)

    visit root_path

    fill_in 'Busca por Tipo do Imóvel', with: 'Sitio para festa'

    click_on 'Buscar por Tipo'

    expect(current_path).to eq(search_by_type_properties_path)
  end
end
