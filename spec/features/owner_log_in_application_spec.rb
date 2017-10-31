require 'rails_helper'

feature 'owner log in application' do
  scenario 'successfully' do
    owner = create(:owner, email: 'teste@teste.com', password: '123456')

    visit root_path
    click_on 'Entrar'

    fill_in 'Email', with: owner.email
    fill_in 'Senha', with: owner.password
    within 'div.sign_in' do
      click_on 'Entrar'
    end


    expect(page).to have_content("Bem vindo, #{owner.name}")
    expect(page).not_to have_content("Entrar")
    expect(page).to have_content("Sair")
  end
end
