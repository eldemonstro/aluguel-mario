require 'rails_helper'

feature 'Visitor send a invalid proposal' do
  scenario 'successfuly' do
    property_type = PropertyType.create(name: 'Casa na praia')

    property = create(:property , property_type: property_type, maximum_occupancy: 10)

   visit property_path(property)

   click_on 'Enviar Proposta'

   fill_in 'Nome', with: 'Maria Silva'
   fill_in 'Email', with: 'mariasilva2000@gmail.com'
   fill_in 'Data Inicial', with: '01/12/2017'
   fill_in 'Data Final', with: '10/12/2017'
   fill_in 'Quatidade de Pessoas', with: 18
   fill_in 'Propósito da Locação', with: 'Passeio de família'
   check 'Concordo com as regras de uso'

   click_on 'Enviar'

   expect(page).to have_css('.alert-danger',
                            text: 'Máximo de ocupantes deve ser respeitado')

  end

  scenario 'whith a maximum rent day' do
    property_type = PropertyType.create(name: 'Casa na praia')

    property = create(:property , property_type: property_type, maximum_rent_days: 9)


    visit property_path(property)

    click_on 'Enviar Proposta'

    fill_in 'Nome', with: 'Maria Silva'
    fill_in 'Email', with: 'mariasilva2000@gmail.com'
    fill_in 'Data Inicial', with: '01/12/2017'
    fill_in 'Data Final', with: '30/12/2017'
    fill_in 'Quatidade de Pessoas', with: 10
    fill_in 'Propósito da Locação', with: 'Passeio de família'
    check 'Concordo com as regras de uso'

    click_on 'Enviar'

    expect(page).to have_css('.alert-danger',
                             text: 'Máximo de dias deve ser respeitado')

  end

  scenario 'following all the specs' do
    property_type = PropertyType.create(name: 'Casa na praia')

    property = create(:property , property_type: property_type)


    visit property_path(property)

    click_on 'Enviar Proposta'

    fill_in 'Nome', with: 'Maria Silva'
    fill_in 'Email', with: 'mariasilva2000@gmail.com'
    fill_in 'Data Inicial', with: '01/12/2017'
    fill_in 'Data Final', with: '4/12/2017'
    fill_in 'Quatidade de Pessoas', with: 10
    fill_in 'Propósito da Locação', with: 'Passeio de família'
    check 'Concordo com as regras de uso'

    click_on 'Enviar'

    expect(page).not_to have_css('.alert-danger',
                             text: 'Máximo de dias deve ser respeitado')
   expect(page).not_to have_css('.alert-danger',
                            text: 'Máximo de ocupantes deve ser respeitado')

  end


end
