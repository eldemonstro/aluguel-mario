require 'rails_helper'

feature 'owner log in application' do
  scenario 'successfully' do
    user = create(:user, email: 'teste@teste.com', password: '12345')

    visit root_path
    click_on 'Entrar'

    fill_in 'Email' with: user.email
    fill_in 'Senha' with: '12345'
    click_on 'Entrar'

    expect(page).to have_content("Bem vindo, #{user.name}")
    expect(page).not_to have_content("Entrar")
    expect(page).to have_content("Sair")
  end
end
