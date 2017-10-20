# == Schema Information
#
# Table name: proposals
#
#  id                 :integer          not null, primary key
#  user_name          :string
#  email              :string
#  start_date         :string
#  end_date           :string
#  total_guests       :integer
#  purpose            :text
#  total_amount       :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  property_id        :integer
#  accept_usage_rules :boolean
#  status             :string
#

class Proposal < ApplicationRecord
  belongs_to :property

  validates :start_date, presence: {
    message: 'Você deve informar a Data Inicial'
  }

  validates :end_date , presence: {
    message: 'Você deve informar a Data Final'
  }

  validates :user_name, presence: {
    message: 'Você deve informar seu Nome'
  }

  validates :email, presence: {
    message: 'Você deve informar seu Email'
  }

  validates :total_guests, presence: {
    message: 'Você deve informar a Quantidade de Pessoas'
  }

  validates :accept_usage_rules, presence: {
    message: 'Aceite as Regras de Uso'
  }

  validate :proposal_can_not_be_send_when_have_periodo_conflict

  def total_amount_calculator
    return if end_date.blank? || start_date.blank? || property.nil?

    date_difference = Date.parse(end_date) - Date.parse(start_date)
    self.total_amount = total_guests * date_difference * property.daily_rate
  end

  def accept
    status = 'accepted'
    save
    refuse_proposals
  end

  def refuse_proposals
    proposals = Proposal.where(property: property, status: 'waiting')

    proposals.each do |proposal|
      if(proposal.start_date.to_date >= start_date.to_date &&
        proposal.start_date.to_date <= end_date.to_date) ||
        (proposal.end_date.to_date >= start_date.to_date &&
        proposal.end_date.to_date <= end_date.to_date)

        proposal.status = 'refused'
        proposal.save
      end
    end

  end

  def proposal_can_not_be_send_when_have_periodo_conflict
    proposals = Proposal.where(property: property, status: 'accepted')
    proposals.each do |proposal|

      if (proposal.start_date.to_date >= start_date.to_date &&
          proposal.start_date.to_date <= end_date.to_date) ||
          (proposal.end_date.to_date >= start_date.to_date &&
          proposal.end_date.to_date <= end_date.to_date)

          errors.add(:end_date, "Não é possivel enviar uma proposta para este periodo")
      end
    end
  end

end
