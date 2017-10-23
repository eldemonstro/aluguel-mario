require 'rails_helper'

feature 'Visitor send a invalid proposal' do
  scenario 'successfuly' do
    property_type = PropertyType.create(name: 'Casa na praia')

    property = Property.create(title: 'Casa grande', area: '300m2',
                    location: 'Maresias', description: 'Casa grande, com o pé na areia',
                    daily_rate: 800.55, rooms: 5, minimum_rent_days: 1,
                    maximum_rent_days: 7, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode ter musica alta',
                    property_type: property_type)

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

    property = Property.create(title: 'Casa grande', area: '300m2',
                    location: 'Maresias', description: 'Casa grande, com o pé na areia',
                    daily_rate: 800.55, rooms: 5, minimum_rent_days: 1,
                    maximum_rent_days: 7, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode ter musica alta',
                    property_type: property_type)

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


end
