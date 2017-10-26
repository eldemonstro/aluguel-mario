require 'rails_helper'

feature 'Visitor visit  homepage to see all properties' do
  scenario 'successfuly' do

    property_type = PropertyType.create(name: 'Sítio na praia')

    property = create(:property, title: 'Sitio legal', property_type: property_type)

    property_2 = create(:property, property_type: property_type )

    visit root_path

    expect(page).to have_css('h4', text: property.title)
    expect(page).to have_css('dd', text: property.location)
    expect(page).to have_css('dd', text: property.property_type.name)
    expect(page).to have_css('dd', text: property.description)
    expect(page).to have_css('dd', text: "R$ 600,00")
    expect(page).to have_css('dd', text: property.minimum_rent_days)

    expect(page).to have_css('h4', text: property_2.title)
    expect(page).to have_css('dd', text: property_2.location)
    expect(page).to have_css('dd', text: property_2.property_type.name)
    expect(page).to have_css('dd', text: property_2.description)
    expect(page).to have_css('dd', text: "R$ 600,00")
    expect(page).to have_css('dd', text: property_2.minimum_rent_days)


  end
  scenario 'and do not have any property registred' do
    visit root_path
    expect(page).to have_css('.alert-danger', text: 'Nenhum imóvel cadastrado')
  end
end
