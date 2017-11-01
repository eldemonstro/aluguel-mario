require 'rails_helper'

feature 'User recieve confirmation' do
  scenario 'successfully' do
    user = create(:user, name: 'Maria Silva', email: 'mariasilva2000@gmail.com')
    login_as(user, scope: :user)
    proposal = create(:proposal)

    visit root_path
    click_on proposal.property.title

    expect(ProposalMailer).to receive(:accept_proposal)

    click_on "Aceitar proposta #{proposal.id}"
  end
end
