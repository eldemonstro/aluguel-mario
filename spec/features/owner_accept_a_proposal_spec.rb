require 'rails_helper'

feature 'Owner accept a proposal' do
  scenario 'successfully' do
    property = create(:property)
    user1 = create(:user, name: 'João')
    accepted_proposal = create(:proposal, property: property, user: user1)

    visit root_path
    click_on property.title
    click_on "Aceitar proposta #{accepted_proposal.id}"

    accepted_proposal.reload

    expect(accepted_proposal.status).to eq 'accepted'
  end

  scenario 'and rejects other proposals with intercalated dates' do
    property = create(:property)
    user1 = create(:user, name: 'João')
    user2 = create(:user, name: 'Maria')
    accepted_proposal = create(:proposal, property: property, user: user1)
    rejected_proposal = create(:proposal, property: property, user: user2)

    visit property_path(property)
    click_on "Aceitar proposta #{accepted_proposal.id}"

    accepted_proposal.reload
    rejected_proposal.reload

    expect(accepted_proposal.status).to eq 'accepted'
    expect(rejected_proposal.status).to eq 'refused'
  end

  scenario 'and do not reject proposals in different dates' do
    property = create(:property)
    user1 = create(:user, name: 'João')
    user2 = create(:user, name: 'Maria')
    accepted_proposal = create(:proposal, property: property, user: user1)
    waiting_proposal = create(:proposal, property: property, user: user2,
                        start_date: '12/01/2019', end_date: '15/01/2019')

    visit root_path
    click_on property.title
    click_on "Aceitar proposta #{accepted_proposal.id}"

    expect(page).not_to have_content accepted_proposal.user.name
    expect(page).not_to have_content accepted_proposal.user.email
    expect(page).to have_content waiting_proposal.user.name
    expect(page).to have_content waiting_proposal.user.email
  end
end
