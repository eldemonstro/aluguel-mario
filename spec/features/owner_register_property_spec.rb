require 'rails_helper'

feature 'Owner Register a Property' do
  scenario 'successfully' do
    owner = create(:owner)
    login_as(owner, :scope => :owner)
    create(:property_type)
    visit root_path
    click_on 'Cadastrar Imóvel'

    fill_in 'Título', with: 'Lindo apartamento 100m da praia'
    select 'Apartamento na praia', from: 'Tipo do Imóvel'
    fill_in 'Localização', with: 'Praia Grande'
    fill_in 'Área', with: '30m²'
    fill_in 'Descrição', with: 'Pode vir que é garantido'
    fill_in 'Valor da Diária', with: 200.50
    fill_in 'Quantidade de Quartos', with: 2
    fill_in 'Mínimo de Diárias', with: 1
    fill_in 'Máximo de Diárias', with: 20
    fill_in 'Ocupação Máxima', with: 15
    fill_in 'Regras de Uso', with: 'Proibido cão e crianças'
    attach_file('Foto', "#{Rails.root}/spec/support/fixtures/image.jpg")
    click_on 'Cadastrar'

    expect(page).to have_content 'Imóvel cadastrado com sucesso'
    expect(page).to have_content 'Lindo apartamento 100m da praia'
    expect(page).to have_content 'Apartamento na praia'
    expect(page).to have_content 'Praia Grande'
    expect(page).to have_content '30m²'
    expect(page).to have_content 'Pode vir que é garantido'
    expect(page).to have_content 'R$ 200,50'
    expect(page).to have_content '2'
    expect(page).to have_content '1'
    expect(page).to have_content '20'
    expect(page).to have_content '15'
    expect(page).to have_content 'Proibido cão e crianças'
    expect(page).to have_xpath("//img[contains(@src,'image.jpg')]")
  end

  scenario 'and forget a field' do
    owner = create(:owner)
    login_as(owner, :scope => :owner)
    create(:property_type)

    visit new_property_path

    fill_in 'Título', with: ''
    fill_in 'Localização', with: ''
    fill_in 'Área', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Quantidade de Quartos', with: ''
    fill_in 'Valor da Diária', with: ''
    fill_in 'Mínimo de Diárias', with: ''
    fill_in 'Máximo de Diárias', with: ''
    fill_in 'Ocupação Máxima', with: ''
    fill_in 'Regras de Uso', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content 'Título não pode ficar em branco'
    expect(page).to have_content 'Você deve informar a Localização'
    expect(page).to have_content 'Você deve informar o Quantidade de Quartos'
    expect(page).to have_content 'Você deve informar o Preço da Diária'
  end
end
