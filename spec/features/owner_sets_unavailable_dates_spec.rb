require 'rails_helper'

feature 'Owner sets unavailable dates' do
  scenario 'successfully' do
    property_type = PropertyType.create(name: 'Casa de campo')
    property = Property.create(title: 'Casa de campo para férias',
                              location: 'Campos do Jordão', area: '100m²',
                              description: 'Bela casa com piscina',
                              daily_rate: 600, rooms: 4, minimum_rent_days: 3,
                              maximum_rent_days: 15, photo: 'casa.jpg',
                              maximum_occupancy: 10, usage_rules: 'sem animais',
                              property_type: property_type)

    visit property_url(property)
    click_on 'Cadastrar Período Indisponível'

    expect(page).to have_content 'Cadastrar Período Indisponínel'

    fill_in 'Nome do período', with: 'Natal'
    fill_in 'Data Inicial', with: '20/12/2017'
    fill_in 'Data Final', with: '28/12/2017'

    click_on 'Enviar'

    expect(page).to have_content 'Período Indisponínel cadastrado com sucesso'

    expect(page).to have_content 'Natal'
    expect(page).to have_content '20/12/2017'
    expect(page).to have_content '28/12/2017'
  end
end
