require 'rails_helper'

feature 'Owner accept a proposal' do
  scenario 'successfuly' do
    property = create(:property)
    proposal_1 = create(:proposal, property: property, user_name: 'João')
    proposal_2 = create(:proposal, property: property, user_name: 'Maria')
    proposal_3 = create(:proposal, property: property, user_name: 'Mario',
                        start_date: '12/01/2019', end_date: '15/01/2019')

    visit property_path(property)
    click_on "Aceitar proposta #{proposal_1.id}"

    expect(page).not_to have_content proposal_2.user_name
    expect(page).not_to have_content proposal_2.email
    expect(page).to have_content proposal_3.user_name
    expect(page).to have_content proposal_3.email
  end

  scenario 'and do not find a proposal with the same date as another already accepted' do
    property_type = PropertyType.create(name: 'Apartamento na praia')
    property = create(:property, property_type: property_type)
    proposal_1 = create(:proposal, property: property, user_name: 'João')
    proposal_2 = create(:proposal, property: property, user_name: 'Maria')

    visit property_path(property)
    click_on "Aceitar proposta #{proposal_1.id}"

    expect(page).not_to have_content "Aceitar proposta #{proposal_2.id}"
  end
end
