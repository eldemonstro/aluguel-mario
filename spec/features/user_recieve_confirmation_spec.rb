require 'rails_helper'

feature 'User recieve confirmation' do
  scenario 'successfully' do
    property_type = PropertyType.create(name: 'Apartamento na praia')

    property = Property.create(title: 'Sitio legal', area: '300m2',
                    location: 'Juquitiba', description: 'Bem grande',
                    daily_rate: 800.55, rooms: 12, minimum_rent_days: 3,
                    maximum_rent_days: 14, photo: 'photo_boa2.jpg',
                    maximum_occupancy: 15, usage_rules: 'Não pode criança',
                    property_type: property_type)

    proposal = Proposal.create(user_name: 'Antonio', email: 'a@a.com',
                                 start_date: '01/01/2017', end_date: '07/01/2017',
                                 total_guests: 5, purpose: 'ferias da familia',
                                 property: property, accept_usage_rules: true)
   visit root_path
   click_on property.title

   expect(ProposalMailer).to receive(:accept_proposal)

   click_on "Aceitar proposta #{proposal.id}"
  end
end
