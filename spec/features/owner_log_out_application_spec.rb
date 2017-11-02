require 'rails_helper'

feature 'owner log out application' do
  scenario 'sucessfully' do
    owner = create(:owner)
    owner = create(:owner)
    login_as(owner, scope: :owner)
    visit root_path

    click_on 'Sair'

    expect(page).to have_content(I18n.t('devise.sessions.signed_out'))
    expect(page).to have_content('Entrar')
  end
end
