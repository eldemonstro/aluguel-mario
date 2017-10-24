require 'rails_helper'

feature 'Visitor Send Proposal' do
  scenario 'successfully' do


    property_type = PropertyType.create(name: 'Casa de campo')

    property = create(:property, property_type: property_type, daily_rate: 300)


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

    expect(page).to have_content property.title
    expect(page).to have_content 'Maria Silva'
    expect(page).to have_content 'mariasilva2000@gmail.com'
    expect(page).to have_content '01/12/2017'
    expect(page).to have_content '10/12/2017'
    expect(page).to have_content '5'
    expect(page).to have_content 'Passeio de família'
    expect(page).to have_content 'R$ 3.000,00'
  end
  scenario 'and fills nothing' do
    property_type = PropertyType.create(name: 'Casa de campo')
    property = create(:property, property_type: property_type, daily_rate: 300)


    visit property_url(property)
    click_on 'Enviar Proposta'

    click_on 'Enviar'

    expect(page).to have_content 'Você deve informar seu Nome'
    expect(page).to have_content 'Você deve informar seu Email'
    expect(page).to have_content 'Você deve informar a Data Inicial'
    expect(page).to have_content 'Você deve informar a Data Final'
    expect(page).to have_content 'Você deve informar a Quantidade de Pessoas'
    expect(page).to have_content 'Aceite as Regras de Uso'
  end
  scenario 'and has a season price' do
    property_type = PropertyType.create(name: 'Casa de campo')
    property = create(:property, property_type: property_type, daily_rate: 300)


    season_price = SeasonRate.create(name: 'Alta Temporada',
                      start_date: '01/12/2017', end_date: '25/12/2017',
                      daily_rate: 800, property: property)


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

    expect(page).to have_content property.title
    expect(page).to have_content 'Maria Silva'
    expect(page).to have_content  'mariasilva2000@gmail.com'
    expect(page).to have_content '01/12/2017'
    expect(page).to have_content '10/12/2017'
    expect(page).to have_content 5
    expect(page).to have_content 'Passeio de família'
    expect(page).to have_content 'R$ 8.000,00'
  end

  scenario 'and is refused automatically' do
    property_type = PropertyType.create(name: 'Casa de campo')
    property = create(:property, property_type: property_type, daily_rate: 300)

    unavailable_date = UnavailableDate.create(name: 'Natal',
                      start_date: '23/12/2017', end_date: '28/12/2017',
                      property: property)

    visit property_url(property)
    click_on 'Enviar Proposta'

    fill_in 'Nome', with: 'Maria Silva'
    fill_in 'Email', with: 'mariasilva2000@gmail.com'
    fill_in 'Data Inicial', with: '24/12/2017'
    fill_in 'Data Final', with: '27/12/2017'
    fill_in 'Quatidade de Pessoas', with: 5
    fill_in 'Propósito da Locação', with: 'Passeio de família'
    check 'Concordo com as regras de uso'

    click_on 'Enviar'

    expect(page).to have_content 'Sua proposta foi rejeitada automaticamente.
Verifique as datas indisponíveis nos detalhes do imóvel.'

  end
end
