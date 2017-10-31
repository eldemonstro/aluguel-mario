class ProposalMailer < ApplicationMailer
  def accept_proposal(proposal)
    mail(to: proposal.user.email, subject: "Parabéns, sua proposta para o imóvel 
      #{proposal.property.title} foi aceita")
  end
end
