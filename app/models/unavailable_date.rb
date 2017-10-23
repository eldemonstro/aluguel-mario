# == Schema Information
#
# Table name: unavailable_dates
#
#  id         :integer          not null, primary key
#  name       :string
#  start_date :date
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UnavailableDate < ApplicationRecord
  belongs_to :property

  validates :name, presence: {
    message: 'Você deve preencher o nome do período'
  }

  validates :start_date, presence: {
    message: 'Você deve preencher a data inicial'
  }

  validates :end_date, presence: {
    message: 'Você deve preencher a data final'
  }

end
