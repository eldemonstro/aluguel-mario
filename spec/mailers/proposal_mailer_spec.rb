require 'rails_helper'
include ActionView::Helpers::NumberHelper

describe ProposalMailer, type: :mailer do
  describe 'accept_proposal' do
    it 'render mail successfully' do
      property_type = PropertyType.create(name: 'Apartamento na praia')

      property = create(:property, property_type: property_type)

      proposal = create(:proposal, property: property)

      mail = ProposalMailer.accept_proposal(proposal)
      expect(mail.to).to include proposal.email
      expect(mail.from).to include 'no-reply@alugatemporada.com'
      expect(mail.subject).to eq "Parabéns, sua proposta para o imóvel #{proposal.property.title} foi aceita"
    end
    it 'render email body' do
      property_type = PropertyType.create(name: 'Apartamento na praia')

      property = create(:property, property_type: property_type)

      proposal = create(:proposal, property: property)
      proposal.total_amount_calculator

      name = 'João da Silva'

      mail = ProposalMailer.accept_proposal(proposal)

      p_1 = %'Eu, João da Silva, portador(a) do CPF nº 111.222.333-44, declaro para os devidos
fins que alugo o imóvel sito à #{proposal.property.address}, para Maria da Silva,
portador(a) do CPF nº 555.666.777-88, entre o período de
#{I18n.localize proposal.start_date} a #{I18n.localize  proposal.end_date}, pelo valor total de #{number_to_currency proposal.total_amount}.'

      p_2 = %(Para este período devem ser respeitados as seguintes regras de uso:
O imóvel não deve ser hospedado por mais que #{proposal.property.maximum_occupancy} pessoas;
O prazo de locação deve ser respeitado e casos de renovações devem ser
tratados diretamente com o proprietário;
Além destas, devem ser respeitadas também as seguintes regras:
#{proposal.property.usage_rules})

      p_3 = (I18n.localize Date.today, format: :long).to_s

      expect(mail.body).to match('Comprovante de Locação')
      expect(mail.body).to include p_1
      expect(mail.body).to include p_2
      expect(mail.body).to include p_3
    end
  end
  describe 'send proposal confirmation' do
    it 'render mail successfully' do
      property = create(:property)
      proposal = create(:proposal, property: property)

      mail = ProposalMailer.new_proposal(proposal)
      expect(mail.to).to include proposal.property.owner.email
      expect(mail.from).to include 'no-reply@alugatemporada.com'
      expect(mail.subject).to eq "Você recebeu uma proposta para o imóvel #{property.title}"
    end
    it 'render email body' do
      property = create(:property)
      proposal = create(:proposal, property: property)
      proposal.total_amount_calculator

      mail = ProposalMailer.new_proposal(proposal)

      body = "Uma nova proposta foi recebida para o imóvel #{property.title}"
      body_2 = %(O usuário #{proposal.user_name} enviou uma proposta com data de inicio em
#{I18n.localize proposal.start_date} e data de término em #{I18n.localize proposal.end_date}
com o propósito #{proposal.purpose})

      expect(mail.body).to include body
      expect(mail.body).to include body_2
    end
  end
end
