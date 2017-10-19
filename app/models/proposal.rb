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

  def total_amount_calculator
    return if end_date.blank? || start_date.blank? || property.nil?

    initial_date = Date.parse(start_date)
    final_date = Date.parse(end_date)
    total_daily_rate = 0

    while initial_date <= final_date do
      daily_rate = get_date_daily_rate(initial_date)
      total_daily_rate += daily_rate
      initial_date += 1
    end

    self.total_amount = total_guests * total_daily_rate
  end

  def get_date_daily_rate(date)
    daily_rates = property.season_rates

    daily_value = 0
    max_daily_value = 0
    daily_rates.each do |daily_rate|
      initial_date = Date.parse(daily_rate.start_date)
      final_date = Date.parse(daily_rate.end_date)
      if initial_date >= date && final_date <= date
        daily_value = daily_rate.daily_rate
        if daily_value > max_daily_value
          max_daily_value = daily_value
          return 1000
        end
      end
    end
    property.daily_rate
  end
end
