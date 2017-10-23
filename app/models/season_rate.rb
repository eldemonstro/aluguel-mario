# == Schema Information
#
# Table name: season_rates
#
#  id          :integer          not null, primary key
#  name        :string
#  start_date  :string
#  end_date    :string
#  daily_rate  :decimal(, )
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  property_id :integer
#

class SeasonRate < ApplicationRecord
  belongs_to :property

  validates :name, presence: {
    message: 'Você deve informar o Nome da Temporada'
  }

  validates :start_date, presence: {
    message: 'Você deve informar a Data Inicial'
  }

  validates :end_date, presence: {
    message: 'Voce deve informar a Data Final'
  }

  validates :daily_rate, presence: {
    message: 'Você deve informar o Valor da Diária'
  }
end
