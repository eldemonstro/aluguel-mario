# == Schema Information
#
# Table name: proposals
#
#  id                 :integer          not null, primary key
#  user_name          :string
#  email              :string
#  start_date         :date
#  end_date           :date
#  total_guests       :integer
#  purpose            :text
#  total_amount       :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  property_id        :integer
#  accept_usage_rules :boolean
#  status             :string           default("waiting")
#

class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :property

  enum status: { waiting: 0, accepted: 1, refused: 2 }

  validates :start_date, presence: {
    message: 'Você deve informar a Data Inicial'
  }

  validates :end_date, presence: {
    message: 'Você deve informar a Data Final'
  }

  validates :total_guests, presence: {
    message: 'Você deve informar a Quantidade de Pessoas'
  }

  validates :accept_usage_rules, presence: {
    message: 'Aceite as Regras de Uso'
  }

  validate :proposal_can_not_be_send_when_have_periodo_conflict
  validate :refuse_proposals_based_on_unavalable_date

  validate :proposal_can_not_be_send_when_have_more_people_than_alowed

  validate :rent_interval_must_respect_the_maximun_and_minimun_rent_days

  def total_amount_calculator
    return if end_date.blank? || start_date.blank? || property.nil?

    initial_date = start_date
    final_date = end_date
    total_daily_rate = 0

    while initial_date <= final_date
      daily_rate = get_date_daily_rate(initial_date)
      total_daily_rate += daily_rate
      initial_date += 1
    end

    self.total_amount = total_daily_rate
  end

  def get_date_daily_rate(date)
    daily_rates = property.season_rates.where(
      ':date >= start_date AND :date <= end_date', date: date
    ).order(
      daily_rate: :desc
    ).first
    daily_rates.nil? ? property.daily_rate : daily_rates.daily_rate
  end

  def accept
    self.accepted!
    save
    refuse_proposals
  end

  def refuse_proposals
    proposals = Proposal.where(property: property, status: :waiting)
    if proposals
      proposals.each do |proposal|
        if (proposal.start_date >= start_date && proposal.start_date <= end_date) ||
           (proposal.end_date >= start_date && proposal.end_date <= end_date)

          proposal.status = 2
          proposal.save(validate: false)
        end
      end
    end
  end

  def proposal_can_not_be_send_when_have_periodo_conflict
    proposals = Proposal.where(property: property, status: 'accepted')
    if proposals
      proposals.each do |proposal|
        if (proposal.start_date >= start_date &&
            proposal.start_date <= end_date) ||
           (proposal.end_date >= start_date &&
           proposal.end_date.to_date <= end_date.to_date)

          errors.add(:end_date, 'Não é possivel enviar uma proposta para este periodo')
        end
      end
    end
  end

  def proposal_can_not_be_send_when_have_more_people_than_alowed
    if total_guests && total_guests > property.maximum_occupancy
      errors.add(:total_guests, 'Máximo de ocupantes deve ser respeitado')
    end
  end

  def rent_interval_must_respect_the_maximun_and_minimun_rent_days
    if start_date && end_date
      interval = end_date - start_date
      if interval.to_i > property.maximum_rent_days
        errors.add(:end_date, 'Máximo de dias deve ser respeitado')
      end
    end
  end

  def refuse_proposals_based_on_unavalable_date
    unavailable_dates = UnavailableDate.where(
      ":start_date between start_date AND end_date OR :end_date between
      start_date AND end_date", start_date: start_date, end_date: end_date
    )

    if unavailable_dates.present?
      errors.add(:proposal,
                 'Sua proposta foi rejeitada automaticamente. Verifique as datas indisponíveis nos detalhes do imóvel.')
    end
  end
end
