require 'rails_helper'

feature 'Owner Sets Season Price' do
  scenario 'successfully' do
    property = create(:property)

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
    property = create(:property)

    visit property_url(property)
    click_on 'Cadastrar preço de Temporada'
    click_on 'Enviar'

    expect(page).to have_content 'Você deve informar o Nome da Temporada'
    expect(page).to have_content 'Você deve informar a Data Inicial'
    expect(page).to have_content 'Voce deve informar a Data Final'
    expect(page).to have_content 'Você deve informar o Valor da Diária'

  end
end
