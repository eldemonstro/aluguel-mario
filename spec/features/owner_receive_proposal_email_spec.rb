require 'rails_helper'

feature 'Owner receive proposal via email' do
  scenario 'successfully' do
    property = create(:property)

    visit property_url(property)
    click_on 'Enviar Proposta'

    fill_in 'Nome', with: 'Maria Silva'
    fill_in 'Email', with: 'mariasilva2000@gmail.com'
    fill_in 'Data Inicial', with: '01/12/2017'
    fill_in 'Data Final', with: '10/12/2017'
    fill_in 'Quatidade de Pessoas', with: 5
    fill_in 'Propósito da Locação', with: 'Passeio de família'
    check 'Concordo com as regras de uso'

    expect(ProposalMailer).to receive(:new_proposal)
    click_on 'Enviar'
  end
end
