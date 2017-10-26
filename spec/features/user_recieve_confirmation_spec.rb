require 'rails_helper'

feature 'User recieve confirmation' do
  scenario 'successfully' do
    proposal = create(:proposal)

    visit root_path
    click_on proposal.property.title

    expect(ProposalMailer).to receive(:accept_proposal)

    click_on "Aceitar proposta #{proposal.id}"
  end
end
