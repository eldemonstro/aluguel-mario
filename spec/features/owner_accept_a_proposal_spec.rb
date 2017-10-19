require 'rails_helper'

feature 'Owner accept a proposal' do
  scenario 'successfuly' do

    property_type = PropertyType.create(name: 'Apartamento na praia')

    property = Property.create(title: 'Sitio legal', area: '300m2',
                    location: 'Juquitiba', description: 'Bem grande',
                    daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                    maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode criança',
                    property_type: property_type)

    proposal_1 = Proposal.create(user_name: 'Antonio', email: 'a@a.com',
                                 start_date: '01/01/2017', end_date: '07/01/2017',
                                 total_guests: 5, purpose: 'ferias da familia',
                                 property: property, accept_usage_rules: true)

    proposal_2 = Proposal.create(user_name: 'Maria', email: 'a@b.com',
                                 start_date: '01/01/2017', end_date: '07/01/2017',
                                 total_guests: 15, purpose: 'ferias dos amigos',
                                 property: property, accept_usage_rules: true)


    proposal_3 = Proposal.create(user_name: 'Mario', email: 'a@c.com',
                                 start_date: '01/02/2017', end_date: '07/02/2017',
                                 total_guests: 10, purpose: 'Festa da firma',
                                 property: property, accept_usage_rules: true)

    visit property_path(property)

    click_on "Aceitar proposta #{proposal_1.id}"

    expect(page).not_to have_content proposal_2.user_name
    expect(page).not_to have_content proposal_2.email

    expect(page).to have_content proposal_3.user_name
    expect(page).to have_content proposal_3.email

    end

    scenario 'and do not find a proposal with the same date as another already accepted' do
      property_type = PropertyType.create(name: 'Apartamento na praia')

      property = Property.create(title: 'Sitio legal', area: '300m2',
                      location: 'Juquitiba', description: 'Bem grande',
                      daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                      maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                      maximum_occupancy: 15, usage_rules: 'Não pode criança',
                      property_type: property_type)

      proposal_1 = Proposal.create(user_name: 'Antonio', email: 'a@a.com',
                                   start_date: '01/01/2017', end_date: '07/01/2017',
                                   total_guests: 5, purpose: 'ferias da familia',
                                   property: property, accept_usage_rules: true,
                                   status: 'accepted')

      proposal_2 = Proposal.create(user_name: 'Maria', email: 'a@b.com',
                                   start_date: '01/01/2017', end_date: '07/01/2017',
                                   total_guests: 15, purpose: 'ferias dos amigos',
                                   property: property, accept_usage_rules: true)



      visit property_path(property)

      expect(page).not_to have_content "Aceitar proposta #{proposal_2.id}"
    end
  end
