require 'rails_helper'

describe ProposalMailer, type: :mailer do
  describe "accept_proposal" do
    it "render mail successfully" do

      property_type = PropertyType.create(name: 'Apartamento na praia')

      property = create(:property, property_type: property_type)

      proposal = create(:proposal, property: property)

      mail = ProposalMailer.accept_proposal(proposal)
      expect(mail.to).to include proposal.user.email
      expect(mail.from).to include 'no-reply@alugatemporada.com'
      expect(mail.subject).to eq "Parabéns, sua proposta para o imóvel #{proposal.property.title} foi aceita"
    end
    it "render email body" do
      property_type = PropertyType.create(name: 'Apartamento na praia')

      property = create(:property, property_type: property_type)

      proposal = create(:proposal, property: property)

      mail = ProposalMailer.accept_proposal(proposal)
      expect(mail.body).to match /Pode programar sua viagem./

    end
  end
end
