require 'rails_helper'

feature 'Visitor Send Proposal' do
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
    click_on 'Enviar Proposta'

    fill_in 'Nome', with: 'Maria Silva'
    fill_in 'Email', with: 'mariasilva2000@gmail.com'
    fill_in 'Data Inicial', with: '01/12/2017'
    fill_in 'Data Final', with: '10/12/2017'
    fill_in 'Quatidade de Pessoas', with: 5
    fill_in 'Propósito da Locação', with: 'Passeio de família'
    check 'Concordo com as regras de uso'

    click_on 'Enviar'

    expect(page).to have_content 'Proposta enviada com sucesso'

    expect(page).to have_content 'Casa de campo para férias'
    expect(page).to have_content 'Maria Silva'
    expect(page).to have_content 'mariasilva2000@gmail.com'
    expect(page).to have_content '01/12/2017'
    expect(page).to have_content '10/12/2017'
    expect(page).to have_content '5'
    expect(page).to have_content 'Passeio de família'
    expect(page).to have_content 'R$ 27000,00'

  end
end
