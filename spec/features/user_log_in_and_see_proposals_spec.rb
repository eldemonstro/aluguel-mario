require 'rails_helper'

feature 'user login' do
  scenario 'successfuly' do
    user = create(:user, email: 'mario@bola.com', password: '12345678')

    visit root_path
    click_on 'Entrar como locador'
    fill_in 'Email', with: 'mario@bola.com'
    fill_in 'Senha', with: '12345678'
    within 'div.actions' do
      click_on 'Entrar'
    end

    expect(page).not_to have_link('Entrar como locador')
    expect(page).to have_link('Sair')
    expect(page).to have_link('Minhas Propostas')
  end
end
