require 'rails_helper'

feature 'Visitor visit  homepage to see all properties' do
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

    expect(page).to have_css('h2', text: property.title)
    expect(page).to have_css('dd', text: property.location)
    expect(page).to have_css('dd', text: property.property_type.name)
    expect(page).to have_css('dd', text: property.description)
    expect(page).to have_css('dd', text: "R$ 800,55")
    expect(page).to have_css('dd', text: property.minimum_rent_days)

    expect(page).to have_css('h2', text: property_2.title)
    expect(page).to have_css('dd', text: property_2.location)
    expect(page).to have_css('dd', text: property_2.property_type.name)
    expect(page).to have_css('dd', text: property_2.description)
    expect(page).to have_css('dd', text: "R$ 80,55")
    expect(page).to have_css('dd', text: property_2.minimum_rent_days)


  end
  scenario 'and do not have any property registred' do
    visit root_path
    expect(page).to have_css('.alert-danger', text: 'Nenhum imóvel cadastrado')
  end
end
