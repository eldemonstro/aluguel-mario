require 'rails_helper'

feature 'owner log in application' do
  scenario 'successfully' do
    owner = create(:owner, email: 'teste@teste.com', password: '123456')

    visit root_path
    click_on 'Entrar como proprietário'

    fill_in 'Email', with: owner.email
    fill_in 'Senha', with: owner.password
    within 'div.actions' do
      click_on 'Entrar'
    end


    expect(page).to have_content("Bem-vindo, #{owner.first_name}")
    expect(page).not_to have_content("Entrar como proprietário")
    expect(page).to have_content("Sair")
  end

  scenario 'and view his properties' do
    owner = create(:owner)
    property = create(:property, owner: owner)
    property2 = create(:property, title: 'Casa na Roca', owner: owner)

    #login_as(owner, :scope => :owner)
    visit root_path
    click_on 'Entrar como proprietário'

    fill_in 'Email', with: owner.email
    fill_in 'Senha', with: owner.password
    within 'div.actions' do
      click_on 'Entrar'
    end

    expect(page).to have_content("Bem-vindo, #{owner.first_name}")
    expect(page).to have_css("h2", text: 'Meus Imóveis')
    expect(page).to have_css("h4", text: property.title)
    expect(page).to have_css("h4", text: property2.title)

  end
end
