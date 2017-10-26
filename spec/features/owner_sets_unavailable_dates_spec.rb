require 'rails_helper'

feature 'Owner sets unavailable dates' do
  scenario 'successfully' do
    property = create(:property)

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

  scenario 'and fills nothing' do
    property = create(:property)

    visit property_url(property)
    click_on 'Cadastrar Período Indisponível'
    click_on 'Enviar'

    expect(page).to have_content 'Você deve preencher o nome do período'
    expect(page).to have_content 'Você deve preencher a data inicial'
    expect(page).to have_content 'Você deve preencher a data final'
  end
end
