require 'rails_helper'

feature 'user login' do
  scenario 'successfully' do
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

  scenario 'and see proposals' do
    user = create(:user, email: 'mario@bola.com', password: '12345678')

    proposal = create(:proposal, user: user)

    visit root_path
    click_on 'Entrar como locador'
    fill_in 'Email', with: 'mario@bola.com'
    fill_in 'Senha', with: '12345678'
    within 'div.actions' do
      click_on 'Entrar'
    end

    click_on 'Minhas Propostas'

    expect(page).to have_content(proposal.purpose)
  end
end
