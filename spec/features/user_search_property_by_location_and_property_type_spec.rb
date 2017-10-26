require 'rails_helper'

feature 'User search for a property by property type' do
  scenario 'successfuly' do

    property_type_1 = PropertyType.create(name: 'Apartamento na praia')
    property_type_2 = PropertyType.create(name: 'Sitio para festa')

    property = create(:property , property_type: property_type_1)


     property_2 = create(:property , title: 'Another property' ,property_type: property_type_2)

    visit root_path

    fill_in 'Busca por Tipo do Imóvel', with: 'Apartamento na praia'

    click_on 'Buscar por Tipo'

    expect(page).to have_content property.title
    expect(page).to have_content property.property_type.name
    expect(page).to have_content property.location
    expect(page).to have_content property.area
    expect(page).to have_content property.description
    expect(page).to have_content "R$ 600,00"
    expect(page).to have_content property.photo

    expect(page).not_to have_content property_2.title

  end

  scenario 'and not find a property' do
    property_type_1 = PropertyType.create(name: 'Apartamento na praia')

    visit root_path

    fill_in 'Busca por Tipo do Imóvel', with: 'Apartamento na praia'

    click_on 'Buscar por Tipo'

    expect(page).to have_content 'Nenhum imóvel encontrado'

  end


end
