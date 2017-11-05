require 'rails_helper'

feature 'owner adds location purpose to property' do
  scenario 'successfully' do
    owner = create(:owner)
    login_as(owner, :scope => :owner)
    property = create(:property)
    create(:location_purpose)

    visit root_path
    click_on property.title
    click_on 'Adicionar propósito de locação'

    select 'Festa', from: 'Propósito de locação'
    click_on 'Adicionar'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content('Festa')
  end

  scenario 'and adds another one' do
    owner = create(:owner)
    login_as(owner, :scope => :owner)
    property = create(:property)
    create(:location_purpose)
    create(:location_purpose, title: 'Férias')

    visit root_path
    click_on property.title
    click_on 'Adicionar propósito de locação'

    select 'Festa', from: 'Propósito de locação'
    click_on 'Adicionar'
    click_on 'Adicionar propósito de locação'
    select 'Férias', from: 'Propósito de locação'
    click_on 'Adicionar'

    expect(current_path).to eq property_path(property)
    expect(page).to have_content('Festa')
    expect(page).to have_content('Férias')
  end

  scenario 'and must be logged in' do
    property = create(:property)

    visit root_path
    click_on property.title

    expect(page).not_to have_content('Adicionar propósito de locação')
  end

  scenario 'can\'t see page if logged out' do
    property = create(:property)

    visit add_location_purpose_property_path(property)

    expect(current_path).to eq new_owner_session_path
  end
end
