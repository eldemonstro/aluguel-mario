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

    date_difference = Date.parse(end_date) - Date.parse(start_date)
    self.total_amount = total_guests * date_difference * property.daily_rate
  end
end
