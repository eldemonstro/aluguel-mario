require 'rails_helper'

feature 'Visitor Use Navigation Menu' do
  scenario 'sucessfully' do
    click_on 'Cadastrar Imóvel'

    expect(page).to have_content 'Cadastre um Imóvel'
  end
end
