require 'rails_helper'

feature 'Owner Sets Season Price' do
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
    click_on 'Cadastrar preço de Temporada'

    expect(page).to have_content 'Cadastrar Temporada'

    fill_in 'Nome', with: 'Alta Temporada'
    fill_in 'Data Inicial', with: '01/12/2017'
    fill_in 'Data Final', with: '01/03/2018'
    fill_in 'Valor da Diária', with: 800

    click_on 'Enviar'

    expect(page).to have_content 'Temporada enviada com sucesso'

    expect(page).to have_content 'Alta Temporada'
    expect(page).to have_content '01/12/2017'
    expect(page).to have_content '01/03/2018'
    expect(page).to have_content 'R$ 800,00'
  end

  scenario 'and fills nothing' do
    property_type = PropertyType.create(name: 'Casa de campo')
    property = Property.create(title: 'Casa de campo para férias',
                              location: 'Campos do Jordão', area: '100m²',
                              description: 'Bela casa com piscina',
                              daily_rate: 600, rooms: 4, minimum_rent_days: 3,
                              maximum_rent_days: 15, photo: 'casa.jpg',
                              maximum_occupancy: 10, usage_rules: 'sem animais',
                              property_type: property_type)

    visit property_url(property)
    click_on 'Cadastrar preço de Temporada'

    click_on 'Enviar'

    expect(page).to have_content 'Você deve informar o Nome da Temporada'
    expect(page).to have_content 'Você deve informar a Data Inicial'
    expect(page).to have_content 'Voce deve informar a Data Final'
    expect(page).to have_content 'Você deve informar o Valor da Diária'
    
  end
end
